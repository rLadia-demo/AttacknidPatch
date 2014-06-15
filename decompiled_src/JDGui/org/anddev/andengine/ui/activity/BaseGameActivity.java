package org.anddev.andengine.ui.activity;

import android.os.Bundle;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.view.Window;
import android.widget.FrameLayout.LayoutParams;
import org.anddev.andengine.audio.music.MusicManager;
import org.anddev.andengine.audio.sound.SoundManager;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.WakeLockOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.opengl.view.RenderSurfaceView;
import org.anddev.andengine.sensor.accelerometer.AccelerometerSensorOptions;
import org.anddev.andengine.sensor.accelerometer.IAccelerometerListener;
import org.anddev.andengine.sensor.location.ILocationListener;
import org.anddev.andengine.sensor.location.LocationSensorOptions;
import org.anddev.andengine.sensor.orientation.IOrientationListener;
import org.anddev.andengine.sensor.orientation.OrientationSensorOptions;
import org.anddev.andengine.ui.IGameInterface;
import org.anddev.andengine.util.Debug;

public abstract class BaseGameActivity
  extends BaseActivity
  implements IGameInterface
{
  protected Engine mEngine;
  private boolean mGameLoaded;
  protected boolean mHasWindowFocused;
  private boolean mPaused;
  protected RenderSurfaceView mRenderSurfaceView;
  private PowerManager.WakeLock mWakeLock;
  
  private void acquireWakeLock(WakeLockOptions paramWakeLockOptions)
  {
    this.mWakeLock = ((PowerManager)getSystemService("power")).newWakeLock(0x20000000 | paramWakeLockOptions.getFlag(), "AndEngine");
    try
    {
      this.mWakeLock.acquire();
      return;
    }
    catch (SecurityException localSecurityException)
    {
      Debug.e("You have to add\n\t<uses-permission android:name=\"android.permission.WAKE_LOCK\"/>\nto your AndroidManifest.xml !", localSecurityException);
    }
  }
  
  private void applyEngineOptions(EngineOptions paramEngineOptions)
  {
    if (paramEngineOptions.isFullscreen()) {
      requestFullscreen();
    }
    if ((paramEngineOptions.needsMusic()) || (paramEngineOptions.needsSound())) {
      setVolumeControlStream(3);
    }
    switch (paramEngineOptions.getScreenOrientation())
    {
    default: 
      return;
    case LANDSCAPE: 
      setRequestedOrientation(0);
      return;
    }
    setRequestedOrientation(1);
  }
  
  private void doPause()
  {
    this.mPaused = true;
    releaseWakeLock();
    this.mEngine.onPause();
    this.mEngine.stop();
    this.mRenderSurfaceView.onPause();
    onGamePaused();
  }
  
  private void doResume()
  {
    if (!this.mGameLoaded)
    {
      onLoadResources();
      Scene localScene = onLoadScene();
      this.mEngine.onLoadComplete(localScene);
      onLoadComplete();
      this.mGameLoaded = true;
    }
    this.mPaused = false;
    acquireWakeLock(this.mEngine.getEngineOptions().getWakeLockOptions());
    this.mEngine.onResume();
    this.mRenderSurfaceView.onResume();
    this.mEngine.start();
    onGameResumed();
  }
  
  private void releaseWakeLock()
  {
    if ((this.mWakeLock != null) && (this.mWakeLock.isHeld())) {
      this.mWakeLock.release();
    }
  }
  
  private void requestFullscreen()
  {
    Window localWindow = getWindow();
    localWindow.addFlags(1024);
    localWindow.clearFlags(2048);
    localWindow.requestFeature(1);
  }
  
  protected FrameLayout.LayoutParams createSurfaceViewLayoutParams()
  {
    FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(-1, -1);
    localLayoutParams.gravity = 17;
    return localLayoutParams;
  }
  
  protected boolean disableAccelerometerSensor()
  {
    return this.mEngine.disableAccelerometerSensor(this);
  }
  
  protected void disableLocationSensor()
  {
    this.mEngine.disableLocationSensor(this);
  }
  
  protected boolean disableOrientationSensor()
  {
    return this.mEngine.disableOrientationSensor(this);
  }
  
  protected boolean enableAccelerometerSensor(IAccelerometerListener paramIAccelerometerListener)
  {
    return this.mEngine.enableAccelerometerSensor(this, paramIAccelerometerListener);
  }
  
  protected boolean enableAccelerometerSensor(IAccelerometerListener paramIAccelerometerListener, AccelerometerSensorOptions paramAccelerometerSensorOptions)
  {
    return this.mEngine.enableAccelerometerSensor(this, paramIAccelerometerListener, paramAccelerometerSensorOptions);
  }
  
  protected void enableLocationSensor(ILocationListener paramILocationListener, LocationSensorOptions paramLocationSensorOptions)
  {
    this.mEngine.enableLocationSensor(this, paramILocationListener, paramLocationSensorOptions);
  }
  
  protected boolean enableOrientationSensor(IOrientationListener paramIOrientationListener)
  {
    return this.mEngine.enableOrientationSensor(this, paramIOrientationListener);
  }
  
  protected boolean enableOrientationSensor(IOrientationListener paramIOrientationListener, OrientationSensorOptions paramOrientationSensorOptions)
  {
    return this.mEngine.enableOrientationSensor(this, paramIOrientationListener, paramOrientationSensorOptions);
  }
  
  protected void enableVibrator()
  {
    this.mEngine.enableVibrator(this);
  }
  
  public Engine getEngine()
  {
    return this.mEngine;
  }
  
  public MusicManager getMusicManager()
  {
    return this.mEngine.getMusicManager();
  }
  
  public SoundManager getSoundManager()
  {
    return this.mEngine.getSoundManager();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mPaused = true;
    this.mEngine = onLoadEngine();
    applyEngineOptions(this.mEngine.getEngineOptions());
    onSetContentView();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    this.mEngine.interruptUpdateThread();
    onUnloadResources();
  }
  
  public void onGamePaused() {}
  
  public void onGameResumed() {}
  
  protected void onPause()
  {
    super.onPause();
    if (!this.mPaused) {
      doPause();
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    if ((this.mPaused) && (this.mHasWindowFocused)) {
      doResume();
    }
  }
  
  protected void onSetContentView()
  {
    this.mRenderSurfaceView = new RenderSurfaceView(this);
    this.mRenderSurfaceView.setEGLConfigChooser(false);
    this.mRenderSurfaceView.setRenderer(this.mEngine);
    setContentView(this.mRenderSurfaceView, createSurfaceViewLayoutParams());
  }
  
  public void onUnloadResources()
  {
    if (this.mEngine.getEngineOptions().needsMusic()) {
      getMusicManager().releaseAll();
    }
    if (this.mEngine.getEngineOptions().needsSound()) {
      getSoundManager().releaseAll();
    }
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    if (paramBoolean)
    {
      if (this.mPaused) {
        doResume();
      }
      this.mHasWindowFocused = true;
      return;
    }
    if (!this.mPaused) {
      doPause();
    }
    this.mHasWindowFocused = false;
  }
  
  public void runOnUpdateThread(Runnable paramRunnable)
  {
    this.mEngine.runOnUpdateThread(paramRunnable);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.activity.BaseGameActivity
 * JD-Core Version:    0.7.0.1
 */