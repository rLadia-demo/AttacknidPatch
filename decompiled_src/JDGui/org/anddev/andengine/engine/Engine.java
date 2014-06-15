package org.anddev.andengine.engine;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Vibrator;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import java.util.List;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.audio.music.MusicFactory;
import org.anddev.andengine.audio.music.MusicManager;
import org.anddev.andengine.audio.sound.SoundFactory;
import org.anddev.andengine.audio.sound.SoundManager;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.UpdateHandlerList;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.SplashScene;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.controller.ITouchController;
import org.anddev.andengine.input.touch.controller.ITouchController.ITouchEventCallback;
import org.anddev.andengine.input.touch.controller.SingleTouchControler;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.font.FontFactory;
import org.anddev.andengine.opengl.font.FontManager;
import org.anddev.andengine.opengl.texture.TextureFactory;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.sensor.SensorDelay;
import org.anddev.andengine.sensor.accelerometer.AccelerometerData;
import org.anddev.andengine.sensor.accelerometer.AccelerometerSensorOptions;
import org.anddev.andengine.sensor.accelerometer.IAccelerometerListener;
import org.anddev.andengine.sensor.location.ILocationListener;
import org.anddev.andengine.sensor.location.LocationProviderStatus;
import org.anddev.andengine.sensor.location.LocationSensorOptions;
import org.anddev.andengine.sensor.orientation.IOrientationListener;
import org.anddev.andengine.sensor.orientation.OrientationData;
import org.anddev.andengine.sensor.orientation.OrientationSensorOptions;
import org.anddev.andengine.util.constants.TimeConstants;

public class Engine
  implements SensorEventListener, View.OnTouchListener, ITouchController.ITouchEventCallback, TimeConstants, LocationListener
{
  private static final float LOADING_SCREEN_DURATION_DEFAULT = 2.0F;
  private static final SensorDelay SENSORDELAY_DEFAULT = SensorDelay.GAME;
  private AccelerometerData mAccelerometerData;
  private IAccelerometerListener mAccelerometerListener;
  private final BufferObjectManager mBufferObjectManager = new BufferObjectManager();
  protected final Camera mCamera;
  private final EngineOptions mEngineOptions;
  private final FontManager mFontManager = new FontManager();
  private boolean mIsMethodTracing;
  private long mLastTick = -1L;
  private Location mLocation;
  private ILocationListener mLocationListener;
  private MusicManager mMusicManager;
  private OrientationData mOrientationData;
  private IOrientationListener mOrientationListener;
  private boolean mRunning = false;
  protected Scene mScene;
  private float mSecondsElapsedTotal = 0.0F;
  private SoundManager mSoundManager;
  protected int mSurfaceHeight = 1;
  protected int mSurfaceWidth = 1;
  private final TextureManager mTextureManager = new TextureManager();
  private final State mThreadLocker = new State(null);
  private ITouchController mTouchController;
  private final UpdateHandlerList mUpdateHandlers = new UpdateHandlerList();
  private final UpdateThread mUpdateThread = new UpdateThread();
  private final RunnableHandler mUpdateThreadRunnableHandler = new RunnableHandler();
  private Vibrator mVibrator;
  
  public Engine(EngineOptions paramEngineOptions)
  {
    TextureRegionFactory.setAssetBasePath("");
    SoundFactory.setAssetBasePath("");
    MusicFactory.setAssetBasePath("");
    FontFactory.setAssetBasePath("");
    BufferObjectManager.setActiveInstance(this.mBufferObjectManager);
    this.mEngineOptions = paramEngineOptions;
    setTouchController(new SingleTouchControler());
    this.mCamera = paramEngineOptions.getCamera();
    if (this.mEngineOptions.needsSound()) {
      this.mSoundManager = new SoundManager();
    }
    if (this.mEngineOptions.needsMusic()) {
      this.mMusicManager = new MusicManager();
    }
    if (this.mEngineOptions.hasLoadingScreen()) {
      initLoadingScreen();
    }
    this.mUpdateThread.start();
  }
  
  private long getNanosecondsElapsed()
  {
    return calculateNanosecondsElapsed(System.nanoTime(), this.mLastTick);
  }
  
  private void initLoadingScreen()
  {
    ITextureSource localITextureSource = this.mEngineOptions.getLoadingScreenTextureSource();
    TextureRegion localTextureRegion = TextureRegionFactory.createFromSource(TextureFactory.createForTextureSourceSize(localITextureSource), localITextureSource, 0, 0);
    setScene(new SplashScene(getCamera(), localTextureRegion));
  }
  
  private boolean isSensorSupported(SensorManager paramSensorManager, int paramInt)
  {
    return paramSensorManager.getSensorList(paramInt).size() > 0;
  }
  
  private void registerSelfAsSensorListener(SensorManager paramSensorManager, int paramInt, SensorDelay paramSensorDelay)
  {
    paramSensorManager.registerListener(this, (Sensor)paramSensorManager.getSensorList(paramInt).get(0), paramSensorDelay.getDelay());
  }
  
  private void unregisterSelfAsSensorListener(SensorManager paramSensorManager, int paramInt)
  {
    paramSensorManager.unregisterListener(this, (Sensor)paramSensorManager.getSensorList(paramInt).get(0));
  }
  
  private void yieldDraw()
    throws InterruptedException
  {
    State localState = this.mThreadLocker;
    localState.notifyCanDraw();
    localState.waitUntilCanUpdate();
  }
  
  protected long calculateNanosecondsElapsed(long paramLong1, long paramLong2)
  {
    return paramLong1 - paramLong2;
  }
  
  public void clearUpdateHandlers()
  {
    this.mUpdateHandlers.clear();
  }
  
  protected void convertSurfaceToSceneTouchEvent(Camera paramCamera, TouchEvent paramTouchEvent)
  {
    paramCamera.convertSurfaceToSceneTouchEvent(paramTouchEvent, this.mSurfaceWidth, this.mSurfaceHeight);
  }
  
  public boolean disableAccelerometerSensor(Context paramContext)
  {
    SensorManager localSensorManager = (SensorManager)paramContext.getSystemService("sensor");
    if (isSensorSupported(localSensorManager, 1))
    {
      unregisterSelfAsSensorListener(localSensorManager, 1);
      return true;
    }
    return false;
  }
  
  public void disableLocationSensor(Context paramContext)
  {
    ((LocationManager)paramContext.getSystemService("location")).removeUpdates(this);
  }
  
  public boolean disableOrientationSensor(Context paramContext)
  {
    SensorManager localSensorManager = (SensorManager)paramContext.getSystemService("sensor");
    if (isSensorSupported(localSensorManager, 3))
    {
      unregisterSelfAsSensorListener(localSensorManager, 3);
      return true;
    }
    return false;
  }
  
  public boolean enableAccelerometerSensor(Context paramContext, IAccelerometerListener paramIAccelerometerListener)
  {
    return enableAccelerometerSensor(paramContext, paramIAccelerometerListener, new AccelerometerSensorOptions(SENSORDELAY_DEFAULT));
  }
  
  public boolean enableAccelerometerSensor(Context paramContext, IAccelerometerListener paramIAccelerometerListener, AccelerometerSensorOptions paramAccelerometerSensorOptions)
  {
    SensorManager localSensorManager = (SensorManager)paramContext.getSystemService("sensor");
    if (isSensorSupported(localSensorManager, 1))
    {
      this.mAccelerometerListener = paramIAccelerometerListener;
      if (this.mAccelerometerData == null) {
        this.mAccelerometerData = new AccelerometerData();
      }
      registerSelfAsSensorListener(localSensorManager, 1, paramAccelerometerSensorOptions.getSensorDelay());
      return true;
    }
    return false;
  }
  
  public void enableLocationSensor(Context paramContext, ILocationListener paramILocationListener, LocationSensorOptions paramLocationSensorOptions)
  {
    this.mLocationListener = paramILocationListener;
    LocationManager localLocationManager = (LocationManager)paramContext.getSystemService("location");
    String str = localLocationManager.getBestProvider(paramLocationSensorOptions, paramLocationSensorOptions.isEnabledOnly());
    localLocationManager.requestLocationUpdates(str, paramLocationSensorOptions.getMinimumTriggerTime(), (float)paramLocationSensorOptions.getMinimumTriggerDistance(), this);
    onLocationChanged(localLocationManager.getLastKnownLocation(str));
  }
  
  public boolean enableOrientationSensor(Context paramContext, IOrientationListener paramIOrientationListener)
  {
    return enableOrientationSensor(paramContext, paramIOrientationListener, new OrientationSensorOptions(SENSORDELAY_DEFAULT));
  }
  
  public boolean enableOrientationSensor(Context paramContext, IOrientationListener paramIOrientationListener, OrientationSensorOptions paramOrientationSensorOptions)
  {
    SensorManager localSensorManager = (SensorManager)paramContext.getSystemService("sensor");
    if (isSensorSupported(localSensorManager, 3))
    {
      this.mOrientationListener = paramIOrientationListener;
      if (this.mOrientationData == null) {
        this.mOrientationData = new OrientationData();
      }
      registerSelfAsSensorListener(localSensorManager, 3, paramOrientationSensorOptions.getSensorDelay());
      return true;
    }
    return false;
  }
  
  public boolean enableVibrator(Context paramContext)
  {
    this.mVibrator = ((Vibrator)paramContext.getSystemService("vibrator"));
    return this.mVibrator != null;
  }
  
  public AccelerometerData getAccelerometerData()
  {
    return this.mAccelerometerData;
  }
  
  public Camera getCamera()
  {
    return this.mCamera;
  }
  
  protected Camera getCameraFromSurfaceTouchEvent(TouchEvent paramTouchEvent)
  {
    return getCamera();
  }
  
  public EngineOptions getEngineOptions()
  {
    return this.mEngineOptions;
  }
  
  public FontManager getFontManager()
  {
    return this.mFontManager;
  }
  
  public MusicManager getMusicManager()
    throws IllegalStateException
  {
    if (this.mMusicManager != null) {
      return this.mMusicManager;
    }
    throw new IllegalStateException("To enable the MusicManager, check the EngineOptions!");
  }
  
  public OrientationData getOrientationData()
  {
    return this.mOrientationData;
  }
  
  public Scene getScene()
  {
    return this.mScene;
  }
  
  protected Scene getSceneFromSurfaceTouchEvent(TouchEvent paramTouchEvent)
  {
    return this.mScene;
  }
  
  public float getSecondsElapsedTotal()
  {
    return this.mSecondsElapsedTotal;
  }
  
  public SoundManager getSoundManager()
    throws IllegalStateException
  {
    if (this.mSoundManager != null) {
      return this.mSoundManager;
    }
    throw new IllegalStateException("To enable the SoundManager, check the EngineOptions!");
  }
  
  public int getSurfaceHeight()
  {
    return this.mSurfaceHeight;
  }
  
  public int getSurfaceWidth()
  {
    return this.mSurfaceWidth;
  }
  
  public TextureManager getTextureManager()
  {
    return this.mTextureManager;
  }
  
  public ITouchController getTouchController()
  {
    return this.mTouchController;
  }
  
  public void interruptUpdateThread()
  {
    this.mUpdateThread.interrupt();
  }
  
  public boolean isMethodTracing()
  {
    return this.mIsMethodTracing;
  }
  
  public boolean isRunning()
  {
    return this.mRunning;
  }
  
  public void onAccuracyChanged(Sensor paramSensor, int paramInt)
  {
    if (this.mRunning) {}
    switch (paramSensor.getType())
    {
    default: 
      return;
    }
    this.mAccelerometerData.setAccuracy(paramInt);
    this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
  }
  
  public void onDrawFrame(GL10 paramGL10)
    throws InterruptedException
  {
    State localState = this.mThreadLocker;
    localState.waitUntilCanDraw();
    this.mTextureManager.updateTextures(paramGL10);
    this.mFontManager.updateFonts(paramGL10);
    if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
      this.mBufferObjectManager.updateBufferObjects((GL11)paramGL10);
    }
    onDrawScene(paramGL10);
    localState.notifyCanUpdate();
  }
  
  protected void onDrawScene(GL10 paramGL10)
  {
    Camera localCamera = getCamera();
    this.mScene.onDraw(paramGL10, localCamera);
    localCamera.onDrawHUD(paramGL10);
  }
  
  public void onLoadComplete(final Scene paramScene)
  {
    if (this.mEngineOptions.hasLoadingScreen())
    {
      registerUpdateHandler(new TimerHandler(2.0F, new ITimerCallback()
      {
        public void onTimePassed(TimerHandler paramAnonymousTimerHandler)
        {
          Engine.this.unregisterUpdateHandler(paramAnonymousTimerHandler);
          Engine.this.setScene(paramScene);
        }
      }));
      return;
    }
    setScene(paramScene);
  }
  
  public void onLocationChanged(Location paramLocation)
  {
    if (this.mLocation == null)
    {
      this.mLocation = paramLocation;
      return;
    }
    if (paramLocation == null)
    {
      this.mLocationListener.onLocationLost();
      return;
    }
    this.mLocation = paramLocation;
    this.mLocationListener.onLocationChanged(paramLocation);
  }
  
  public void onPause() {}
  
  public void onProviderDisabled(String paramString)
  {
    this.mLocationListener.onLocationProviderDisabled();
  }
  
  public void onProviderEnabled(String paramString)
  {
    this.mLocationListener.onLocationProviderEnabled();
  }
  
  public void onResume()
  {
    this.mTextureManager.reloadTextures();
    this.mFontManager.reloadFonts();
    BufferObjectManager.setActiveInstance(this.mBufferObjectManager);
    this.mBufferObjectManager.reloadBufferObjects();
  }
  
  public void onSensorChanged(SensorEvent paramSensorEvent)
  {
    if (this.mRunning) {}
    switch (paramSensorEvent.sensor.getType())
    {
    case 2: 
    default: 
      return;
    case 1: 
      this.mAccelerometerData.setValues(paramSensorEvent.values);
      this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
      return;
    }
    this.mOrientationData.setValues(paramSensorEvent.values);
    this.mOrientationListener.onOrientationChanged(this.mOrientationData);
  }
  
  public void onStatusChanged(String paramString, int paramInt, Bundle paramBundle)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 2: 
      this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.AVAILABLE, paramBundle);
      return;
    case 0: 
      this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.OUT_OF_SERVICE, paramBundle);
      return;
    }
    this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.TEMPORARILY_UNAVAILABLE, paramBundle);
  }
  
  void onTickUpdate()
    throws InterruptedException
  {
    if (this.mRunning)
    {
      onUpdate(getNanosecondsElapsed());
      yieldDraw();
      return;
    }
    yieldDraw();
    Thread.sleep(16L);
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (this.mRunning)
    {
      boolean bool = this.mTouchController.onHandleMotionEvent(paramMotionEvent);
      try
      {
        Thread.sleep(20L);
        return bool;
      }
      catch (InterruptedException localInterruptedException)
      {
        org.anddev.andengine.util.Debug.e(localInterruptedException);
        return bool;
      }
    }
    return false;
  }
  
  public boolean onTouchEvent(TouchEvent paramTouchEvent)
  {
    Scene localScene = getSceneFromSurfaceTouchEvent(paramTouchEvent);
    Camera localCamera = getCameraFromSurfaceTouchEvent(paramTouchEvent);
    convertSurfaceToSceneTouchEvent(localCamera, paramTouchEvent);
    if (onTouchHUD(localCamera, paramTouchEvent)) {
      return true;
    }
    return onTouchScene(localScene, paramTouchEvent);
  }
  
  protected boolean onTouchHUD(Camera paramCamera, TouchEvent paramTouchEvent)
  {
    if (paramCamera.hasHUD()) {
      return paramCamera.getHUD().onSceneTouchEvent(paramTouchEvent);
    }
    return false;
  }
  
  protected boolean onTouchScene(Scene paramScene, TouchEvent paramTouchEvent)
  {
    if (paramScene != null) {
      return paramScene.onSceneTouchEvent(paramTouchEvent);
    }
    return false;
  }
  
  protected void onUpdate(long paramLong)
    throws InterruptedException
  {
    float f = (float)paramLong / 1.0E+009F;
    this.mSecondsElapsedTotal = (f + this.mSecondsElapsedTotal);
    this.mLastTick = (paramLong + this.mLastTick);
    this.mTouchController.onUpdate(f);
    updateUpdateHandlers(f);
    onUpdateScene(f);
  }
  
  protected void onUpdateScene(float paramFloat)
  {
    if (this.mScene != null) {
      this.mScene.onUpdate(paramFloat);
    }
  }
  
  public void registerUpdateHandler(IUpdateHandler paramIUpdateHandler)
  {
    this.mUpdateHandlers.add(paramIUpdateHandler);
  }
  
  public void runOnUpdateThread(Runnable paramRunnable)
  {
    this.mUpdateThreadRunnableHandler.postRunnable(paramRunnable);
  }
  
  public void setScene(Scene paramScene)
  {
    this.mScene = paramScene;
  }
  
  public void setSurfaceSize(int paramInt1, int paramInt2)
  {
    this.mSurfaceWidth = paramInt1;
    this.mSurfaceHeight = paramInt2;
  }
  
  public void setTouchController(ITouchController paramITouchController)
  {
    this.mTouchController = paramITouchController;
    this.mTouchController.applyTouchOptions(this.mEngineOptions.getTouchOptions());
    this.mTouchController.setTouchEventCallback(this);
  }
  
  public void start()
  {
    try
    {
      if (!this.mRunning)
      {
        this.mLastTick = System.nanoTime();
        this.mRunning = true;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void startMethodTracing(String paramString)
  {
    if (!this.mIsMethodTracing)
    {
      this.mIsMethodTracing = true;
      android.os.Debug.startMethodTracing(paramString);
    }
  }
  
  public void stop()
  {
    try
    {
      if (this.mRunning) {
        this.mRunning = false;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void stopMethodTracing()
  {
    if (this.mIsMethodTracing)
    {
      android.os.Debug.stopMethodTracing();
      this.mIsMethodTracing = false;
    }
  }
  
  public void unregisterUpdateHandler(IUpdateHandler paramIUpdateHandler)
  {
    this.mUpdateHandlers.remove(paramIUpdateHandler);
  }
  
  protected void updateUpdateHandlers(float paramFloat)
  {
    this.mUpdateThreadRunnableHandler.onUpdate(paramFloat);
    this.mUpdateHandlers.onUpdate(paramFloat);
    getCamera().onUpdate(paramFloat);
  }
  
  public void vibrate(long paramLong)
    throws IllegalStateException
  {
    if (this.mVibrator != null)
    {
      this.mVibrator.vibrate(paramLong);
      return;
    }
    throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
  }
  
  public void vibrate(long[] paramArrayOfLong, int paramInt)
    throws IllegalStateException
  {
    if (this.mVibrator != null)
    {
      this.mVibrator.vibrate(paramArrayOfLong, paramInt);
      return;
    }
    throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
  }
  
  private static class State
  {
    boolean mDrawing = false;
    
    public void notifyCanDraw()
    {
      try
      {
        this.mDrawing = true;
        notifyAll();
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
    
    public void notifyCanUpdate()
    {
      try
      {
        this.mDrawing = false;
        notifyAll();
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
    
    /* Error */
    public void waitUntilCanDraw()
      throws InterruptedException
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 12	org/anddev/andengine/engine/Engine$State:mDrawing	Z
      //   6: istore_2
      //   7: iload_2
      //   8: ifeq +6 -> 14
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: aload_0
      //   15: invokevirtual 25	java/lang/Object:wait	()V
      //   18: goto -16 -> 2
      //   21: astore_1
      //   22: aload_0
      //   23: monitorexit
      //   24: aload_1
      //   25: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	26	0	this	State
      //   21	4	1	localObject	Object
      //   6	2	2	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   2	7	21	finally
      //   14	18	21	finally
    }
    
    /* Error */
    public void waitUntilCanUpdate()
      throws InterruptedException
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 12	org/anddev/andengine/engine/Engine$State:mDrawing	Z
      //   6: istore_2
      //   7: iload_2
      //   8: ifne +6 -> 14
      //   11: aload_0
      //   12: monitorexit
      //   13: return
      //   14: aload_0
      //   15: invokevirtual 25	java/lang/Object:wait	()V
      //   18: goto -16 -> 2
      //   21: astore_1
      //   22: aload_0
      //   23: monitorexit
      //   24: aload_1
      //   25: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	26	0	this	State
      //   21	4	1	localObject	Object
      //   6	2	2	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   2	7	21	finally
      //   14	18	21	finally
    }
  }
  
  private class UpdateThread
    extends Thread
  {
    public UpdateThread()
    {
      super();
    }
    
    public void run()
    {
      try
      {
        for (;;)
        {
          Engine.this.onTickUpdate();
        }
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        org.anddev.andengine.util.Debug.d("UpdateThread interrupted. Don't worry - this Exception is most likely expected!", localInterruptedException);
        interrupt();
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.Engine
 * JD-Core Version:    0.7.0.1
 */