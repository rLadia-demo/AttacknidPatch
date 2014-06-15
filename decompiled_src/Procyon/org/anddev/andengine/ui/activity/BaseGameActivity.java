package org.anddev.andengine.ui.activity;

import org.anddev.andengine.ui.*;
import org.anddev.andengine.engine.*;
import org.anddev.andengine.opengl.view.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.util.*;
import android.widget.*;
import android.content.*;
import org.anddev.andengine.sensor.accelerometer.*;
import org.anddev.andengine.sensor.location.*;
import org.anddev.andengine.sensor.orientation.*;
import org.anddev.andengine.audio.music.*;
import org.anddev.andengine.audio.sound.*;
import android.os.*;
import android.view.*;

public abstract class BaseGameActivity extends BaseActivity implements IGameInterface
{
    protected Engine mEngine;
    private boolean mGameLoaded;
    protected boolean mHasWindowFocused;
    private boolean mPaused;
    protected RenderSurfaceView mRenderSurfaceView;
    private PowerManager$WakeLock mWakeLock;
    
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation() {
        final int[] $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation = BaseGameActivity.$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation;
        if ($switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation != null) {
            return $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation;
        }
        final int[] $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation2 = new int[EngineOptions.ScreenOrientation.values().length];
        while (true) {
            try {
                $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation2[EngineOptions.ScreenOrientation.LANDSCAPE.ordinal()] = 1;
                try {
                    $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation2[EngineOptions.ScreenOrientation.PORTRAIT.ordinal()] = 2;
                    return BaseGameActivity.$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation = $switch_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation2;
                }
                catch (NoSuchFieldError noSuchFieldError) {}
            }
            catch (NoSuchFieldError noSuchFieldError2) {
                continue;
            }
            break;
        }
    }
    
    private void acquireWakeLock(final WakeLockOptions wakeLockOptions) {
        this.mWakeLock = ((PowerManager)this.getSystemService("power")).newWakeLock(0x20000000 | wakeLockOptions.getFlag(), "AndEngine");
        try {
            this.mWakeLock.acquire();
        }
        catch (SecurityException ex) {
            Debug.e("You have to add\n\t<uses-permission android:name=\"android.permission.WAKE_LOCK\"/>\nto your AndroidManifest.xml !", ex);
        }
    }
    
    private void applyEngineOptions(final EngineOptions engineOptions) {
        if (engineOptions.isFullscreen()) {
            this.requestFullscreen();
        }
        if (engineOptions.needsMusic() || engineOptions.needsSound()) {
            this.setVolumeControlStream(3);
        }
        switch ($SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation()[engineOptions.getScreenOrientation().ordinal()]) {
            default: {}
            case 1: {
                this.setRequestedOrientation(0);
            }
            case 2: {
                this.setRequestedOrientation(1);
            }
        }
    }
    
    private void doPause() {
        this.mPaused = true;
        this.releaseWakeLock();
        this.mEngine.onPause();
        this.mEngine.stop();
        this.mRenderSurfaceView.onPause();
        this.onGamePaused();
    }
    
    private void doResume() {
        if (!this.mGameLoaded) {
            this.onLoadResources();
            this.mEngine.onLoadComplete(this.onLoadScene());
            this.onLoadComplete();
            this.mGameLoaded = true;
        }
        this.mPaused = false;
        this.acquireWakeLock(this.mEngine.getEngineOptions().getWakeLockOptions());
        this.mEngine.onResume();
        this.mRenderSurfaceView.onResume();
        this.mEngine.start();
        this.onGameResumed();
    }
    
    private void releaseWakeLock() {
        if (this.mWakeLock != null && this.mWakeLock.isHeld()) {
            this.mWakeLock.release();
        }
    }
    
    private void requestFullscreen() {
        final Window window = this.getWindow();
        window.addFlags(1024);
        window.clearFlags(2048);
        window.requestFeature(1);
    }
    
    protected FrameLayout$LayoutParams createSurfaceViewLayoutParams() {
        final FrameLayout$LayoutParams frameLayout$LayoutParams = new FrameLayout$LayoutParams(-1, -1);
        frameLayout$LayoutParams.gravity = 17;
        return frameLayout$LayoutParams;
    }
    
    protected boolean disableAccelerometerSensor() {
        return this.mEngine.disableAccelerometerSensor((Context)this);
    }
    
    protected void disableLocationSensor() {
        this.mEngine.disableLocationSensor((Context)this);
    }
    
    protected boolean disableOrientationSensor() {
        return this.mEngine.disableOrientationSensor((Context)this);
    }
    
    protected boolean enableAccelerometerSensor(final IAccelerometerListener accelerometerListener) {
        return this.mEngine.enableAccelerometerSensor((Context)this, accelerometerListener);
    }
    
    protected boolean enableAccelerometerSensor(final IAccelerometerListener accelerometerListener, final AccelerometerSensorOptions accelerometerSensorOptions) {
        return this.mEngine.enableAccelerometerSensor((Context)this, accelerometerListener, accelerometerSensorOptions);
    }
    
    protected void enableLocationSensor(final ILocationListener locationListener, final LocationSensorOptions locationSensorOptions) {
        this.mEngine.enableLocationSensor((Context)this, locationListener, locationSensorOptions);
    }
    
    protected boolean enableOrientationSensor(final IOrientationListener orientationListener) {
        return this.mEngine.enableOrientationSensor((Context)this, orientationListener);
    }
    
    protected boolean enableOrientationSensor(final IOrientationListener orientationListener, final OrientationSensorOptions orientationSensorOptions) {
        return this.mEngine.enableOrientationSensor((Context)this, orientationListener, orientationSensorOptions);
    }
    
    protected void enableVibrator() {
        this.mEngine.enableVibrator((Context)this);
    }
    
    public Engine getEngine() {
        return this.mEngine;
    }
    
    public MusicManager getMusicManager() {
        return this.mEngine.getMusicManager();
    }
    
    public SoundManager getSoundManager() {
        return this.mEngine.getSoundManager();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.mPaused = true;
        this.mEngine = this.onLoadEngine();
        this.applyEngineOptions(this.mEngine.getEngineOptions());
        this.onSetContentView();
    }
    
    protected void onDestroy() {
        super.onDestroy();
        this.mEngine.interruptUpdateThread();
        this.onUnloadResources();
    }
    
    @Override
    public void onGamePaused() {
    }
    
    @Override
    public void onGameResumed() {
    }
    
    protected void onPause() {
        super.onPause();
        if (!this.mPaused) {
            this.doPause();
        }
    }
    
    protected void onResume() {
        super.onResume();
        if (this.mPaused && this.mHasWindowFocused) {
            this.doResume();
        }
    }
    
    protected void onSetContentView() {
        (this.mRenderSurfaceView = new RenderSurfaceView((Context)this)).setEGLConfigChooser(false);
        this.mRenderSurfaceView.setRenderer(this.mEngine);
        this.setContentView((View)this.mRenderSurfaceView, (ViewGroup$LayoutParams)this.createSurfaceViewLayoutParams());
    }
    
    @Override
    public void onUnloadResources() {
        if (this.mEngine.getEngineOptions().needsMusic()) {
            this.getMusicManager().releaseAll();
        }
        if (this.mEngine.getEngineOptions().needsSound()) {
            this.getSoundManager().releaseAll();
        }
    }
    
    public void onWindowFocusChanged(final boolean b) {
        super.onWindowFocusChanged(b);
        if (b) {
            if (this.mPaused) {
                this.doResume();
            }
            this.mHasWindowFocused = true;
            return;
        }
        if (!this.mPaused) {
            this.doPause();
        }
        this.mHasWindowFocused = false;
    }
    
    public void runOnUpdateThread(final Runnable runnable) {
        this.mEngine.runOnUpdateThread(runnable);
    }
}
