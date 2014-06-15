/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.os.Bundle
 *  android.os.PowerManager
 *  android.os.PowerManager$WakeLock
 *  android.view.View
 *  android.view.ViewGroup
 *  android.view.ViewGroup$LayoutParams
 *  android.view.Window
 *  android.widget.FrameLayout
 *  android.widget.FrameLayout$LayoutParams
 */
package org.anddev.andengine.ui.activity;

import android.content.Context;
import android.os.Bundle;
import android.os.PowerManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
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
import org.anddev.andengine.ui.activity.BaseActivity;
import org.anddev.andengine.util.Debug;

public abstract class BaseGameActivity
extends BaseActivity
implements IGameInterface {
    private static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation;
    protected Engine mEngine;
    private boolean mGameLoaded;
    protected boolean mHasWindowFocused;
    private boolean mPaused;
    protected RenderSurfaceView mRenderSurfaceView;
    private PowerManager.WakeLock mWakeLock;

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation() {
        int[] arrn;
        int[] arrn2 = BaseGameActivity.$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation;
        if (arrn2 != null) {
            return arrn2;
        }
        arrn = new int[EngineOptions.ScreenOrientation.values().length];
        try {
            arrn[EngineOptions.ScreenOrientation.LANDSCAPE.ordinal()] = 1;
        }
        catch (NoSuchFieldError var2_3) {}
        try {
            arrn[EngineOptions.ScreenOrientation.PORTRAIT.ordinal()] = 2;
        }
        catch (NoSuchFieldError var3_2) {}
        BaseGameActivity.$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation = arrn;
        return arrn;
    }

    private void acquireWakeLock(WakeLockOptions wakeLockOptions) {
        this.mWakeLock = ((PowerManager)this.getSystemService("power")).newWakeLock(536870912 | wakeLockOptions.getFlag(), "AndEngine");
        try {
            this.mWakeLock.acquire();
            return;
        }
        catch (SecurityException var2_2) {
            Debug.e("You have to add\n\t<uses-permission android:name=\"android.permission.WAKE_LOCK\"/>\nto your AndroidManifest.xml !", var2_2);
            return;
        }
    }

    private void applyEngineOptions(EngineOptions engineOptions) {
        if (engineOptions.isFullscreen()) {
            this.requestFullscreen();
        }
        if (engineOptions.needsMusic() || engineOptions.needsSound()) {
            this.setVolumeControlStream(3);
        }
        switch (BaseGameActivity.$SWITCH_TABLE$org$anddev$andengine$engine$options$EngineOptions$ScreenOrientation()[engineOptions.getScreenOrientation().ordinal()]) {
            default: {
                return;
            }
            case 1: {
                this.setRequestedOrientation(0);
                return;
            }
            case 2: 
        }
        this.setRequestedOrientation(1);
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
            Scene scene = this.onLoadScene();
            this.mEngine.onLoadComplete(scene);
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
        if (this.mWakeLock == null || !this.mWakeLock.isHeld()) return;
        this.mWakeLock.release();
    }

    private void requestFullscreen() {
        Window window = this.getWindow();
        window.addFlags(1024);
        window.clearFlags(2048);
        window.requestFeature(1);
    }

    protected FrameLayout.LayoutParams createSurfaceViewLayoutParams() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        return layoutParams;
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

    protected boolean enableAccelerometerSensor(IAccelerometerListener iAccelerometerListener) {
        return this.mEngine.enableAccelerometerSensor((Context)this, iAccelerometerListener);
    }

    protected boolean enableAccelerometerSensor(IAccelerometerListener iAccelerometerListener, AccelerometerSensorOptions accelerometerSensorOptions) {
        return this.mEngine.enableAccelerometerSensor((Context)this, iAccelerometerListener, accelerometerSensorOptions);
    }

    protected void enableLocationSensor(ILocationListener iLocationListener, LocationSensorOptions locationSensorOptions) {
        this.mEngine.enableLocationSensor((Context)this, iLocationListener, locationSensorOptions);
    }

    protected boolean enableOrientationSensor(IOrientationListener iOrientationListener) {
        return this.mEngine.enableOrientationSensor((Context)this, iOrientationListener);
    }

    protected boolean enableOrientationSensor(IOrientationListener iOrientationListener, OrientationSensorOptions orientationSensorOptions) {
        return this.mEngine.enableOrientationSensor((Context)this, iOrientationListener, orientationSensorOptions);
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

    protected void onCreate(Bundle bundle) {
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

    public void onGamePaused() {
    }

    public void onGameResumed() {
    }

    protected void onPause() {
        super.onPause();
        if (this.mPaused) return;
        this.doPause();
    }

    protected void onResume() {
        super.onResume();
        if (!this.mPaused || !this.mHasWindowFocused) return;
        this.doResume();
    }

    protected void onSetContentView() {
        this.mRenderSurfaceView = new RenderSurfaceView((Context)this);
        this.mRenderSurfaceView.setEGLConfigChooser(false);
        this.mRenderSurfaceView.setRenderer(this.mEngine);
        this.setContentView((View)this.mRenderSurfaceView, (ViewGroup.LayoutParams)this.createSurfaceViewLayoutParams());
    }

    public void onUnloadResources() {
        if (this.mEngine.getEngineOptions().needsMusic()) {
            this.getMusicManager().releaseAll();
        }
        if (!this.mEngine.getEngineOptions().needsSound()) return;
        this.getSoundManager().releaseAll();
    }

    public void onWindowFocusChanged(boolean bl) {
        super.onWindowFocusChanged(bl);
        if (bl) {
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

    public void runOnUpdateThread(Runnable runnable) {
        this.mEngine.runOnUpdateThread(runnable);
    }
}

