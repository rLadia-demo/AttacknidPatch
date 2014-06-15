package org.anddev.andengine.engine;

import org.anddev.andengine.util.constants.*;
import org.anddev.andengine.sensor.*;
import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.engine.handler.runnable.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.audio.sound.*;
import org.anddev.andengine.audio.music.*;
import org.anddev.andengine.opengl.font.*;
import org.anddev.andengine.input.touch.controller.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.input.touch.*;
import android.content.*;
import org.anddev.andengine.sensor.accelerometer.*;
import android.location.*;
import org.anddev.andengine.sensor.orientation.*;
import org.anddev.andengine.opengl.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.handler.timer.*;
import org.anddev.andengine.engine.handler.*;
import android.hardware.*;
import android.os.*;
import org.anddev.andengine.sensor.location.*;
import android.view.*;
import org.anddev.andengine.util.*;

public class Engine implements SensorEventListener, View$OnTouchListener, ITouchEventCallback, TimeConstants, LocationListener
{
    private static final float LOADING_SCREEN_DURATION_DEFAULT = 2.0f;
    private static final SensorDelay SENSORDELAY_DEFAULT;
    private AccelerometerData mAccelerometerData;
    private IAccelerometerListener mAccelerometerListener;
    private final BufferObjectManager mBufferObjectManager;
    protected final Camera mCamera;
    private final EngineOptions mEngineOptions;
    private final FontManager mFontManager;
    private boolean mIsMethodTracing;
    private long mLastTick;
    private Location mLocation;
    private ILocationListener mLocationListener;
    private MusicManager mMusicManager;
    private OrientationData mOrientationData;
    private IOrientationListener mOrientationListener;
    private boolean mRunning;
    protected Scene mScene;
    private float mSecondsElapsedTotal;
    private SoundManager mSoundManager;
    protected int mSurfaceHeight;
    protected int mSurfaceWidth;
    private final TextureManager mTextureManager;
    private final State mThreadLocker;
    private ITouchController mTouchController;
    private final UpdateHandlerList mUpdateHandlers;
    private final UpdateThread mUpdateThread;
    private final RunnableHandler mUpdateThreadRunnableHandler;
    private Vibrator mVibrator;
    
    static {
        SENSORDELAY_DEFAULT = SensorDelay.GAME;
    }
    
    public Engine(final EngineOptions mEngineOptions) {
        super();
        this.mRunning = false;
        this.mLastTick = -1L;
        this.mSecondsElapsedTotal = 0.0f;
        this.mThreadLocker = new State(null);
        this.mUpdateThread = new UpdateThread();
        this.mUpdateThreadRunnableHandler = new RunnableHandler();
        this.mTextureManager = new TextureManager();
        this.mBufferObjectManager = new BufferObjectManager();
        this.mFontManager = new FontManager();
        this.mUpdateHandlers = new UpdateHandlerList();
        this.mSurfaceWidth = 1;
        this.mSurfaceHeight = 1;
        TextureRegionFactory.setAssetBasePath("");
        SoundFactory.setAssetBasePath("");
        MusicFactory.setAssetBasePath("");
        FontFactory.setAssetBasePath("");
        BufferObjectManager.setActiveInstance(this.mBufferObjectManager);
        this.mEngineOptions = mEngineOptions;
        this.setTouchController(new SingleTouchControler());
        this.mCamera = mEngineOptions.getCamera();
        if (this.mEngineOptions.needsSound()) {
            this.mSoundManager = new SoundManager();
        }
        if (this.mEngineOptions.needsMusic()) {
            this.mMusicManager = new MusicManager();
        }
        if (this.mEngineOptions.hasLoadingScreen()) {
            this.initLoadingScreen();
        }
        this.mUpdateThread.start();
    }
    
    private long getNanosecondsElapsed() {
        return this.calculateNanosecondsElapsed(System.nanoTime(), this.mLastTick);
    }
    
    private void initLoadingScreen() {
        final ITextureSource loadingScreenTextureSource = this.mEngineOptions.getLoadingScreenTextureSource();
        this.setScene(new SplashScene(this.getCamera(), TextureRegionFactory.createFromSource(TextureFactory.createForTextureSourceSize(loadingScreenTextureSource), loadingScreenTextureSource, 0, 0)));
    }
    
    private boolean isSensorSupported(final SensorManager sensorManager, final int n) {
        return sensorManager.getSensorList(n).size() > 0;
    }
    
    private void registerSelfAsSensorListener(final SensorManager sensorManager, final int n, final SensorDelay sensorDelay) {
        sensorManager.registerListener((SensorEventListener)this, (Sensor)sensorManager.getSensorList(n).get(0), sensorDelay.getDelay());
    }
    
    private void unregisterSelfAsSensorListener(final SensorManager sensorManager, final int n) {
        sensorManager.unregisterListener((SensorEventListener)this, (Sensor)sensorManager.getSensorList(n).get(0));
    }
    
    private void yieldDraw() throws InterruptedException {
        final State mThreadLocker = this.mThreadLocker;
        mThreadLocker.notifyCanDraw();
        mThreadLocker.waitUntilCanUpdate();
    }
    
    protected long calculateNanosecondsElapsed(final long n, final long n2) {
        return n - n2;
    }
    
    public void clearUpdateHandlers() {
        this.mUpdateHandlers.clear();
    }
    
    protected void convertSurfaceToSceneTouchEvent(final Camera camera, final TouchEvent touchEvent) {
        camera.convertSurfaceToSceneTouchEvent(touchEvent, this.mSurfaceWidth, this.mSurfaceHeight);
    }
    
    public boolean disableAccelerometerSensor(final Context context) {
        final SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (this.isSensorSupported(sensorManager, 1)) {
            this.unregisterSelfAsSensorListener(sensorManager, 1);
            return true;
        }
        return false;
    }
    
    public void disableLocationSensor(final Context context) {
        ((LocationManager)context.getSystemService("location")).removeUpdates((LocationListener)this);
    }
    
    public boolean disableOrientationSensor(final Context context) {
        final SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (this.isSensorSupported(sensorManager, 3)) {
            this.unregisterSelfAsSensorListener(sensorManager, 3);
            return true;
        }
        return false;
    }
    
    public boolean enableAccelerometerSensor(final Context context, final IAccelerometerListener accelerometerListener) {
        return this.enableAccelerometerSensor(context, accelerometerListener, new AccelerometerSensorOptions(Engine.SENSORDELAY_DEFAULT));
    }
    
    public boolean enableAccelerometerSensor(final Context context, final IAccelerometerListener mAccelerometerListener, final AccelerometerSensorOptions accelerometerSensorOptions) {
        final SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (this.isSensorSupported(sensorManager, 1)) {
            this.mAccelerometerListener = mAccelerometerListener;
            if (this.mAccelerometerData == null) {
                this.mAccelerometerData = new AccelerometerData();
            }
            this.registerSelfAsSensorListener(sensorManager, 1, accelerometerSensorOptions.getSensorDelay());
            return true;
        }
        return false;
    }
    
    public void enableLocationSensor(final Context context, final ILocationListener mLocationListener, final LocationSensorOptions locationSensorOptions) {
        this.mLocationListener = mLocationListener;
        final LocationManager locationManager = (LocationManager)context.getSystemService("location");
        final String bestProvider = locationManager.getBestProvider((Criteria)locationSensorOptions, locationSensorOptions.isEnabledOnly());
        locationManager.requestLocationUpdates(bestProvider, locationSensorOptions.getMinimumTriggerTime(), (float)locationSensorOptions.getMinimumTriggerDistance(), (LocationListener)this);
        this.onLocationChanged(locationManager.getLastKnownLocation(bestProvider));
    }
    
    public boolean enableOrientationSensor(final Context context, final IOrientationListener orientationListener) {
        return this.enableOrientationSensor(context, orientationListener, new OrientationSensorOptions(Engine.SENSORDELAY_DEFAULT));
    }
    
    public boolean enableOrientationSensor(final Context context, final IOrientationListener mOrientationListener, final OrientationSensorOptions orientationSensorOptions) {
        final SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (this.isSensorSupported(sensorManager, 3)) {
            this.mOrientationListener = mOrientationListener;
            if (this.mOrientationData == null) {
                this.mOrientationData = new OrientationData();
            }
            this.registerSelfAsSensorListener(sensorManager, 3, orientationSensorOptions.getSensorDelay());
            return true;
        }
        return false;
    }
    
    public boolean enableVibrator(final Context context) {
        this.mVibrator = (Vibrator)context.getSystemService("vibrator");
        return this.mVibrator != null;
    }
    
    public AccelerometerData getAccelerometerData() {
        return this.mAccelerometerData;
    }
    
    public Camera getCamera() {
        return this.mCamera;
    }
    
    protected Camera getCameraFromSurfaceTouchEvent(final TouchEvent touchEvent) {
        return this.getCamera();
    }
    
    public EngineOptions getEngineOptions() {
        return this.mEngineOptions;
    }
    
    public FontManager getFontManager() {
        return this.mFontManager;
    }
    
    public MusicManager getMusicManager() throws IllegalStateException {
        if (this.mMusicManager != null) {
            return this.mMusicManager;
        }
        throw new IllegalStateException("To enable the MusicManager, check the EngineOptions!");
    }
    
    public OrientationData getOrientationData() {
        return this.mOrientationData;
    }
    
    public Scene getScene() {
        return this.mScene;
    }
    
    protected Scene getSceneFromSurfaceTouchEvent(final TouchEvent touchEvent) {
        return this.mScene;
    }
    
    public float getSecondsElapsedTotal() {
        return this.mSecondsElapsedTotal;
    }
    
    public SoundManager getSoundManager() throws IllegalStateException {
        if (this.mSoundManager != null) {
            return this.mSoundManager;
        }
        throw new IllegalStateException("To enable the SoundManager, check the EngineOptions!");
    }
    
    public int getSurfaceHeight() {
        return this.mSurfaceHeight;
    }
    
    public int getSurfaceWidth() {
        return this.mSurfaceWidth;
    }
    
    public TextureManager getTextureManager() {
        return this.mTextureManager;
    }
    
    public ITouchController getTouchController() {
        return this.mTouchController;
    }
    
    public void interruptUpdateThread() {
        this.mUpdateThread.interrupt();
    }
    
    public boolean isMethodTracing() {
        return this.mIsMethodTracing;
    }
    
    public boolean isRunning() {
        return this.mRunning;
    }
    
    public void onAccuracyChanged(final Sensor sensor, final int accuracy) {
        if (this.mRunning) {
            switch (sensor.getType()) {
                case 1: {
                    this.mAccelerometerData.setAccuracy(accuracy);
                    this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
                }
            }
        }
    }
    
    public void onDrawFrame(final GL10 gl10) throws InterruptedException {
        final State mThreadLocker = this.mThreadLocker;
        mThreadLocker.waitUntilCanDraw();
        this.mTextureManager.updateTextures(gl10);
        this.mFontManager.updateFonts(gl10);
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            this.mBufferObjectManager.updateBufferObjects((GL11)gl10);
        }
        this.onDrawScene(gl10);
        mThreadLocker.notifyCanUpdate();
    }
    
    protected void onDrawScene(final GL10 gl10) {
        final Camera camera = this.getCamera();
        this.mScene.onDraw(gl10, camera);
        camera.onDrawHUD(gl10);
    }
    
    public void onLoadComplete(final Scene scene) {
        if (this.mEngineOptions.hasLoadingScreen()) {
            this.registerUpdateHandler(new TimerHandler(2.0f, new ITimerCallback() {
                @Override
                public void onTimePassed(final TimerHandler timerHandler) {
                    Engine.this.unregisterUpdateHandler(timerHandler);
                    Engine.this.setScene(scene);
                }
            }));
            return;
        }
        this.setScene(scene);
    }
    
    public void onLocationChanged(final Location location) {
        if (this.mLocation == null) {
            this.mLocation = location;
            return;
        }
        if (location == null) {
            this.mLocationListener.onLocationLost();
            return;
        }
        this.mLocation = location;
        this.mLocationListener.onLocationChanged(location);
    }
    
    public void onPause() {
    }
    
    public void onProviderDisabled(final String s) {
        this.mLocationListener.onLocationProviderDisabled();
    }
    
    public void onProviderEnabled(final String s) {
        this.mLocationListener.onLocationProviderEnabled();
    }
    
    public void onResume() {
        this.mTextureManager.reloadTextures();
        this.mFontManager.reloadFonts();
        BufferObjectManager.setActiveInstance(this.mBufferObjectManager);
        this.mBufferObjectManager.reloadBufferObjects();
    }
    
    public void onSensorChanged(final SensorEvent sensorEvent) {
        if (this.mRunning) {
            switch (sensorEvent.sensor.getType()) {
                case 1: {
                    this.mAccelerometerData.setValues(sensorEvent.values);
                    this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
                }
                case 3: {
                    this.mOrientationData.setValues(sensorEvent.values);
                    this.mOrientationListener.onOrientationChanged(this.mOrientationData);
                }
            }
        }
    }
    
    public void onStatusChanged(final String s, final int n, final Bundle bundle) {
        switch (n) {
            default: {}
            case 2: {
                this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.AVAILABLE, bundle);
            }
            case 0: {
                this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.OUT_OF_SERVICE, bundle);
            }
            case 1: {
                this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.TEMPORARILY_UNAVAILABLE, bundle);
            }
        }
    }
    
    void onTickUpdate() throws InterruptedException {
        if (this.mRunning) {
            this.onUpdate(this.getNanosecondsElapsed());
            this.yieldDraw();
            return;
        }
        this.yieldDraw();
        Thread.sleep(16L);
    }
    
    public boolean onTouch(final View view, final MotionEvent motionEvent) {
        if (this.mRunning) {
            final boolean onHandleMotionEvent = this.mTouchController.onHandleMotionEvent(motionEvent);
            try {
                Thread.sleep(20L);
                return onHandleMotionEvent;
            }
            catch (InterruptedException ex) {
                Debug.e(ex);
                return onHandleMotionEvent;
            }
        }
        return false;
    }
    
    public boolean onTouchEvent(final TouchEvent touchEvent) {
        final Scene sceneFromSurfaceTouchEvent = this.getSceneFromSurfaceTouchEvent(touchEvent);
        final Camera cameraFromSurfaceTouchEvent = this.getCameraFromSurfaceTouchEvent(touchEvent);
        this.convertSurfaceToSceneTouchEvent(cameraFromSurfaceTouchEvent, touchEvent);
        return this.onTouchHUD(cameraFromSurfaceTouchEvent, touchEvent) || this.onTouchScene(sceneFromSurfaceTouchEvent, touchEvent);
    }
    
    protected boolean onTouchHUD(final Camera camera, final TouchEvent touchEvent) {
        return camera.hasHUD() && camera.getHUD().onSceneTouchEvent(touchEvent);
    }
    
    protected boolean onTouchScene(final Scene scene, final TouchEvent touchEvent) {
        return scene != null && scene.onSceneTouchEvent(touchEvent);
    }
    
    protected void onUpdate(final long n) throws InterruptedException {
        final float n2 = n / 1.0E9f;
        this.mSecondsElapsedTotal += n2;
        this.mLastTick += n;
        this.mTouchController.onUpdate(n2);
        this.updateUpdateHandlers(n2);
        this.onUpdateScene(n2);
    }
    
    protected void onUpdateScene(final float n) {
        if (this.mScene != null) {
            this.mScene.onUpdate(n);
        }
    }
    
    public void registerUpdateHandler(final IUpdateHandler updateHandler) {
        this.mUpdateHandlers.add(updateHandler);
    }
    
    public void runOnUpdateThread(final Runnable runnable) {
        this.mUpdateThreadRunnableHandler.postRunnable(runnable);
    }
    
    public void setScene(final Scene mScene) {
        this.mScene = mScene;
    }
    
    public void setSurfaceSize(final int mSurfaceWidth, final int mSurfaceHeight) {
        this.mSurfaceWidth = mSurfaceWidth;
        this.mSurfaceHeight = mSurfaceHeight;
    }
    
    public void setTouchController(final ITouchController mTouchController) {
        (this.mTouchController = mTouchController).applyTouchOptions(this.mEngineOptions.getTouchOptions());
        this.mTouchController.setTouchEventCallback((ITouchController.ITouchEventCallback)this);
    }
    
    public void start() {
        synchronized (this) {
            if (!this.mRunning) {
                this.mLastTick = System.nanoTime();
                this.mRunning = true;
            }
        }
    }
    
    public void startMethodTracing(final String s) {
        if (!this.mIsMethodTracing) {
            this.mIsMethodTracing = true;
            android.os.Debug.startMethodTracing(s);
        }
    }
    
    public void stop() {
        synchronized (this) {
            if (this.mRunning) {
                this.mRunning = false;
            }
        }
    }
    
    public void stopMethodTracing() {
        if (this.mIsMethodTracing) {
            android.os.Debug.stopMethodTracing();
            this.mIsMethodTracing = false;
        }
    }
    
    public void unregisterUpdateHandler(final IUpdateHandler updateHandler) {
        this.mUpdateHandlers.remove(updateHandler);
    }
    
    protected void updateUpdateHandlers(final float n) {
        this.mUpdateThreadRunnableHandler.onUpdate(n);
        this.mUpdateHandlers.onUpdate(n);
        this.getCamera().onUpdate(n);
    }
    
    public void vibrate(final long n) throws IllegalStateException {
        if (this.mVibrator != null) {
            this.mVibrator.vibrate(n);
            return;
        }
        throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
    }
    
    public void vibrate(final long[] array, final int n) throws IllegalStateException {
        if (this.mVibrator != null) {
            this.mVibrator.vibrate(array, n);
            return;
        }
        throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
    }
    
    private static class State
    {
        boolean mDrawing;
        
        private State() {
            super();
            this.mDrawing = false;
        }
        
        public void notifyCanDraw() {
            synchronized (this) {
                this.mDrawing = true;
                this.notifyAll();
            }
        }
        
        public void notifyCanUpdate() {
            synchronized (this) {
                this.mDrawing = false;
                this.notifyAll();
            }
        }
        
        public void waitUntilCanDraw() throws InterruptedException {
            synchronized (this) {
                while (!this.mDrawing) {
                    this.wait();
                }
            }
        }
        
        public void waitUntilCanUpdate() throws InterruptedException {
            synchronized (this) {
                while (this.mDrawing) {
                    this.wait();
                }
            }
        }
    }
    
    private class UpdateThread extends Thread
    {
        public UpdateThread() {
            super("UpdateThread");
        }
        
        @Override
        public void run() {
            try {
                while (true) {
                    Engine.this.onTickUpdate();
                }
            }
            catch (InterruptedException ex) {
                Debug.d("UpdateThread interrupted. Don't worry - this Exception is most likely expected!", ex);
                this.interrupt();
            }
        }
    }
}
