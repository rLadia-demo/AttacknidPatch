/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.hardware.Sensor
 *  android.hardware.SensorEvent
 *  android.hardware.SensorEventListener
 *  android.hardware.SensorManager
 *  android.location.Criteria
 *  android.location.Location
 *  android.location.LocationListener
 *  android.location.LocationManager
 *  android.os.Bundle
 *  android.os.Debug
 *  android.os.Vibrator
 *  android.view.MotionEvent
 *  android.view.View
 *  android.view.View$OnTouchListener
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.engine;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Debug;
import android.os.Vibrator;
import android.view.MotionEvent;
import android.view.View;
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
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.SplashScene;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.controller.ITouchController;
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
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.constants.TimeConstants;

public class Engine
implements SensorEventListener,
View.OnTouchListener,
ITouchController.ITouchEventCallback,
TimeConstants,
LocationListener {
    private static final float LOADING_SCREEN_DURATION_DEFAULT = 2.0f;
    private static final SensorDelay SENSORDELAY_DEFAULT = SensorDelay.GAME;
    private AccelerometerData mAccelerometerData;
    private IAccelerometerListener mAccelerometerListener;
    private final BufferObjectManager mBufferObjectManager;
    protected final Camera mCamera;
    private final EngineOptions mEngineOptions;
    private final FontManager mFontManager;
    private boolean mIsMethodTracing;
    private long mLastTick = -1;
    private Location mLocation;
    private ILocationListener mLocationListener;
    private MusicManager mMusicManager;
    private OrientationData mOrientationData;
    private IOrientationListener mOrientationListener;
    private boolean mRunning = false;
    protected Scene mScene;
    private float mSecondsElapsedTotal = 0.0f;
    private SoundManager mSoundManager;
    protected int mSurfaceHeight;
    protected int mSurfaceWidth;
    private final TextureManager mTextureManager;
    private final State mThreadLocker = new State(null);
    private ITouchController mTouchController;
    private final UpdateHandlerList mUpdateHandlers;
    private final UpdateThread mUpdateThread;
    private final RunnableHandler mUpdateThreadRunnableHandler;
    private Vibrator mVibrator;

    public Engine(EngineOptions engineOptions) {
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
        this.mEngineOptions = engineOptions;
        this.setTouchController(new SingleTouchControler());
        this.mCamera = engineOptions.getCamera();
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
        ITextureSource iTextureSource = this.mEngineOptions.getLoadingScreenTextureSource();
        TextureRegion textureRegion = TextureRegionFactory.createFromSource(TextureFactory.createForTextureSourceSize(iTextureSource), iTextureSource, 0, 0);
        this.setScene(new SplashScene(this.getCamera(), textureRegion));
    }

    private boolean isSensorSupported(SensorManager sensorManager, int n) {
        if (sensorManager.getSensorList(n).size() <= 0) return false;
        return true;
    }

    private void registerSelfAsSensorListener(SensorManager sensorManager, int n, SensorDelay sensorDelay) {
        sensorManager.registerListener((SensorEventListener)this, (Sensor)sensorManager.getSensorList(n).get(0), sensorDelay.getDelay());
    }

    private void unregisterSelfAsSensorListener(SensorManager sensorManager, int n) {
        sensorManager.unregisterListener((SensorEventListener)this, (Sensor)sensorManager.getSensorList(n).get(0));
    }

    private void yieldDraw() throws InterruptedException {
        State state = this.mThreadLocker;
        state.notifyCanDraw();
        state.waitUntilCanUpdate();
    }

    protected long calculateNanosecondsElapsed(long l, long l2) {
        return l - l2;
    }

    public void clearUpdateHandlers() {
        this.mUpdateHandlers.clear();
    }

    protected void convertSurfaceToSceneTouchEvent(Camera camera, TouchEvent touchEvent) {
        camera.convertSurfaceToSceneTouchEvent(touchEvent, this.mSurfaceWidth, this.mSurfaceHeight);
    }

    public boolean disableAccelerometerSensor(Context context) {
        SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (!this.isSensorSupported(sensorManager, 1)) return false;
        this.unregisterSelfAsSensorListener(sensorManager, 1);
        return true;
    }

    public void disableLocationSensor(Context context) {
        ((LocationManager)context.getSystemService("location")).removeUpdates((LocationListener)this);
    }

    public boolean disableOrientationSensor(Context context) {
        SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (!this.isSensorSupported(sensorManager, 3)) return false;
        this.unregisterSelfAsSensorListener(sensorManager, 3);
        return true;
    }

    public boolean enableAccelerometerSensor(Context context, IAccelerometerListener iAccelerometerListener) {
        return this.enableAccelerometerSensor(context, iAccelerometerListener, new AccelerometerSensorOptions(Engine.SENSORDELAY_DEFAULT));
    }

    public boolean enableAccelerometerSensor(Context context, IAccelerometerListener iAccelerometerListener, AccelerometerSensorOptions accelerometerSensorOptions) {
        SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (!this.isSensorSupported(sensorManager, 1)) return false;
        this.mAccelerometerListener = iAccelerometerListener;
        if (this.mAccelerometerData == null) {
            this.mAccelerometerData = new AccelerometerData();
        }
        this.registerSelfAsSensorListener(sensorManager, 1, accelerometerSensorOptions.getSensorDelay());
        return true;
    }

    public void enableLocationSensor(Context context, ILocationListener iLocationListener, LocationSensorOptions locationSensorOptions) {
        this.mLocationListener = iLocationListener;
        LocationManager locationManager = (LocationManager)context.getSystemService("location");
        String string = locationManager.getBestProvider((Criteria)locationSensorOptions, locationSensorOptions.isEnabledOnly());
        locationManager.requestLocationUpdates(string, locationSensorOptions.getMinimumTriggerTime(), (float)locationSensorOptions.getMinimumTriggerDistance(), (LocationListener)this);
        this.onLocationChanged(locationManager.getLastKnownLocation(string));
    }

    public boolean enableOrientationSensor(Context context, IOrientationListener iOrientationListener) {
        return this.enableOrientationSensor(context, iOrientationListener, new OrientationSensorOptions(Engine.SENSORDELAY_DEFAULT));
    }

    public boolean enableOrientationSensor(Context context, IOrientationListener iOrientationListener, OrientationSensorOptions orientationSensorOptions) {
        SensorManager sensorManager = (SensorManager)context.getSystemService("sensor");
        if (!this.isSensorSupported(sensorManager, 3)) return false;
        this.mOrientationListener = iOrientationListener;
        if (this.mOrientationData == null) {
            this.mOrientationData = new OrientationData();
        }
        this.registerSelfAsSensorListener(sensorManager, 3, orientationSensorOptions.getSensorDelay());
        return true;
    }

    public boolean enableVibrator(Context context) {
        this.mVibrator = (Vibrator)context.getSystemService("vibrator");
        if (this.mVibrator == null) return false;
        return true;
    }

    public AccelerometerData getAccelerometerData() {
        return this.mAccelerometerData;
    }

    public Camera getCamera() {
        return this.mCamera;
    }

    protected Camera getCameraFromSurfaceTouchEvent(TouchEvent touchEvent) {
        return this.getCamera();
    }

    public EngineOptions getEngineOptions() {
        return this.mEngineOptions;
    }

    public FontManager getFontManager() {
        return this.mFontManager;
    }

    public MusicManager getMusicManager() throws IllegalStateException {
        if (this.mMusicManager == null) throw new IllegalStateException("To enable the MusicManager, check the EngineOptions!");
        return this.mMusicManager;
    }

    public OrientationData getOrientationData() {
        return this.mOrientationData;
    }

    public Scene getScene() {
        return this.mScene;
    }

    protected Scene getSceneFromSurfaceTouchEvent(TouchEvent touchEvent) {
        return this.mScene;
    }

    public float getSecondsElapsedTotal() {
        return this.mSecondsElapsedTotal;
    }

    public SoundManager getSoundManager() throws IllegalStateException {
        if (this.mSoundManager == null) throw new IllegalStateException("To enable the SoundManager, check the EngineOptions!");
        return this.mSoundManager;
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

    public void onAccuracyChanged(Sensor sensor, int n) {
        if (!this.mRunning) return;
        switch (sensor.getType()) {
            default: {
                return;
            }
            case 1: 
        }
        this.mAccelerometerData.setAccuracy(n);
        this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
    }

    public void onDrawFrame(GL10 gL10) throws InterruptedException {
        State state = this.mThreadLocker;
        state.waitUntilCanDraw();
        this.mTextureManager.updateTextures(gL10);
        this.mFontManager.updateFonts(gL10);
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            this.mBufferObjectManager.updateBufferObjects((GL11)gL10);
        }
        this.onDrawScene(gL10);
        state.notifyCanUpdate();
    }

    protected void onDrawScene(GL10 gL10) {
        Camera camera = this.getCamera();
        this.mScene.onDraw(gL10, camera);
        camera.onDrawHUD(gL10);
    }

    public void onLoadComplete(Scene scene) {
        if (this.mEngineOptions.hasLoadingScreen()) {
            this.registerUpdateHandler(new TimerHandler(2.0f, new ITimerCallback(){

                @Override
                public void onTimePassed(TimerHandler timerHandler) {
                    Engine.this.unregisterUpdateHandler(timerHandler);
                    Engine.this.setScene(scene);
                }
            }));
            return;
        }
        this.setScene(scene);
    }

    public void onLocationChanged(Location location) {
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

    public void onProviderDisabled(String string) {
        this.mLocationListener.onLocationProviderDisabled();
    }

    public void onProviderEnabled(String string) {
        this.mLocationListener.onLocationProviderEnabled();
    }

    public void onResume() {
        this.mTextureManager.reloadTextures();
        this.mFontManager.reloadFonts();
        BufferObjectManager.setActiveInstance(this.mBufferObjectManager);
        this.mBufferObjectManager.reloadBufferObjects();
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        if (!this.mRunning) return;
        switch (sensorEvent.sensor.getType()) {
            default: {
                return;
            }
            case 1: {
                this.mAccelerometerData.setValues(sensorEvent.values);
                this.mAccelerometerListener.onAccelerometerChanged(this.mAccelerometerData);
                return;
            }
            case 3: 
        }
        this.mOrientationData.setValues(sensorEvent.values);
        this.mOrientationListener.onOrientationChanged(this.mOrientationData);
    }

    public void onStatusChanged(String string, int n, Bundle bundle) {
        switch (n) {
            default: {
                return;
            }
            case 2: {
                this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.AVAILABLE, bundle);
                return;
            }
            case 0: {
                this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.OUT_OF_SERVICE, bundle);
                return;
            }
            case 1: 
        }
        this.mLocationListener.onLocationProviderStatusChanged(LocationProviderStatus.TEMPORARILY_UNAVAILABLE, bundle);
    }

    void onTickUpdate() throws InterruptedException {
        if (this.mRunning) {
            this.onUpdate(this.getNanosecondsElapsed());
            this.yieldDraw();
            return;
        }
        this.yieldDraw();
        Thread.sleep(16);
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (!this.mRunning) return false;
        boolean bl = this.mTouchController.onHandleMotionEvent(motionEvent);
        try {
            Thread.sleep(20);
            return bl;
        }
        catch (InterruptedException var4_3) {
            org.anddev.andengine.util.Debug.e(var4_3);
            return bl;
        }
    }

    public boolean onTouchEvent(TouchEvent touchEvent) {
        Scene scene = this.getSceneFromSurfaceTouchEvent(touchEvent);
        Camera camera = this.getCameraFromSurfaceTouchEvent(touchEvent);
        this.convertSurfaceToSceneTouchEvent(camera, touchEvent);
        if (!this.onTouchHUD(camera, touchEvent)) return this.onTouchScene(scene, touchEvent);
        return true;
    }

    protected boolean onTouchHUD(Camera camera, TouchEvent touchEvent) {
        if (!camera.hasHUD()) return false;
        return camera.getHUD().onSceneTouchEvent(touchEvent);
    }

    protected boolean onTouchScene(Scene scene, TouchEvent touchEvent) {
        if (scene == null) return false;
        return scene.onSceneTouchEvent(touchEvent);
    }

    protected void onUpdate(long l) throws InterruptedException {
        float f = (float)l / 1.0E9f;
        this.mSecondsElapsedTotal = f + this.mSecondsElapsedTotal;
        this.mLastTick = l + this.mLastTick;
        this.mTouchController.onUpdate(f);
        this.updateUpdateHandlers(f);
        this.onUpdateScene(f);
    }

    protected void onUpdateScene(float f) {
        if (this.mScene == null) return;
        this.mScene.onUpdate(f);
    }

    public void registerUpdateHandler(IUpdateHandler iUpdateHandler) {
        this.mUpdateHandlers.add((Object)iUpdateHandler);
    }

    public void runOnUpdateThread(Runnable runnable) {
        this.mUpdateThreadRunnableHandler.postRunnable(runnable);
    }

    public void setScene(Scene scene) {
        this.mScene = scene;
    }

    public void setSurfaceSize(int n, int n2) {
        this.mSurfaceWidth = n;
        this.mSurfaceHeight = n2;
    }

    public void setTouchController(ITouchController iTouchController) {
        this.mTouchController = iTouchController;
        this.mTouchController.applyTouchOptions(this.mEngineOptions.getTouchOptions());
        this.mTouchController.setTouchEventCallback((ITouchController.ITouchEventCallback)this);
    }

    public void start() {
        synchronized (this) {
            if (!this.mRunning) {
                this.mLastTick = System.nanoTime();
                this.mRunning = true;
            }
            return;
        }
    }

    public void startMethodTracing(String string) {
        if (this.mIsMethodTracing) return;
        this.mIsMethodTracing = true;
        Debug.startMethodTracing((String)string);
    }

    public void stop() {
        synchronized (this) {
            if (this.mRunning) {
                this.mRunning = false;
            }
            return;
        }
    }

    public void stopMethodTracing() {
        if (!this.mIsMethodTracing) return;
        Debug.stopMethodTracing();
        this.mIsMethodTracing = false;
    }

    public void unregisterUpdateHandler(IUpdateHandler iUpdateHandler) {
        this.mUpdateHandlers.remove((Object)iUpdateHandler);
    }

    protected void updateUpdateHandlers(float f) {
        this.mUpdateThreadRunnableHandler.onUpdate(f);
        this.mUpdateHandlers.onUpdate(f);
        this.getCamera().onUpdate(f);
    }

    public void vibrate(long l) throws IllegalStateException {
        if (this.mVibrator == null) throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
        this.mVibrator.vibrate(l);
    }

    public void vibrate(long[] arrl, int n) throws IllegalStateException {
        if (this.mVibrator == null) throw new IllegalStateException("You need to enable the Vibrator before you can use it!");
        this.mVibrator.vibrate(arrl, n);
    }

    static class State {
        boolean mDrawing = false;

        private State() {
        }

        /* synthetic */ State(State state) {
            this();
        }

        public void notifyCanDraw() {
            synchronized (this) {
                this.mDrawing = true;
                this.notifyAll();
                return;
            }
        }

        public void notifyCanUpdate() {
            synchronized (this) {
                this.mDrawing = false;
                this.notifyAll();
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void waitUntilCanDraw() throws InterruptedException {
            synchronized (this) {
                do {
                    boolean bl = this.mDrawing;
                    if (bl) return;
                    this.wait();
                } while (true);
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public void waitUntilCanUpdate() throws InterruptedException {
            synchronized (this) {
                do {
                    boolean bl = this.mDrawing;
                    if (!bl) return;
                    this.wait();
                } while (true);
            }
        }
    }

    class UpdateThread
    extends Thread {
        public UpdateThread() {
            super("UpdateThread");
        }

        @Override
        public void run() {
            try {
                do {
                    Engine.this.onTickUpdate();
                } while (true);
            }
            catch (InterruptedException var1_1) {
                org.anddev.andengine.util.Debug.d("UpdateThread interrupted. Don't worry - this Exception is most likely expected!", var1_1);
                this.interrupt();
                return;
            }
        }
    }

}

