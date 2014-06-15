/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.os.Bundle
 *  android.os.SystemClock
 *  android.service.wallpaper.WallpaperService
 *  android.service.wallpaper.WallpaperService$Engine
 *  android.view.MotionEvent
 *  android.view.View
 */
package org.anddev.andengine.extension.ui.livewallpaper;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import android.service.wallpaper.WallpaperService;
import android.view.MotionEvent;
import android.view.View;
import net.rbgrn.opengl.GLWallpaperService;
import org.anddev.andengine.audio.music.MusicManager;
import org.anddev.andengine.audio.sound.SoundManager;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.opengl.view.GLSurfaceView;
import org.anddev.andengine.opengl.view.RenderSurfaceView;
import org.anddev.andengine.sensor.accelerometer.AccelerometerSensorOptions;
import org.anddev.andengine.sensor.accelerometer.IAccelerometerListener;
import org.anddev.andengine.sensor.location.ILocationListener;
import org.anddev.andengine.sensor.location.LocationSensorOptions;
import org.anddev.andengine.sensor.orientation.IOrientationListener;
import org.anddev.andengine.sensor.orientation.OrientationSensorOptions;
import org.anddev.andengine.ui.IGameInterface;

public abstract class BaseLiveWallpaperService
extends GLWallpaperService
implements IGameInterface {
    protected Engine mEngine;

    protected void applyEngineOptions(EngineOptions engineOptions) {
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

    protected boolean enableVibrator() {
        return this.mEngine.enableVibrator((Context)this);
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

    public void onCreate() {
        super.onCreate();
        this.mEngine = this.onLoadEngine();
        this.applyEngineOptions(this.mEngine.getEngineOptions());
        this.onLoadResources();
        Scene scene = this.onLoadScene();
        this.mEngine.onLoadComplete(scene);
        this.onLoadComplete();
        this.mEngine.start();
    }

    public WallpaperService.Engine onCreateEngine() {
        return new BaseWallpaperGLEngine();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mEngine.interruptUpdateThread();
        this.onUnloadResources();
    }

    protected void onDrop(int n2, int n2) {
    }

    public void onGamePaused() {
    }

    public void onGameResumed() {
    }

    protected void onPause() {
        this.mEngine.stop();
        this.onGamePaused();
    }

    protected void onResume() {
        this.mEngine.start();
        this.onGameResumed();
    }

    protected void onTap(int n, int n2) {
        this.mEngine.onTouch(null, MotionEvent.obtain((long)SystemClock.uptimeMillis(), (long)SystemClock.uptimeMillis(), (int)0, (float)n, (float)n2, (int)0));
    }

    public void onUnloadResources() {
        if (this.mEngine.getEngineOptions().needsMusic()) {
            this.getMusicManager().releaseAll();
        }
        if (!this.mEngine.getEngineOptions().needsSound()) return;
        this.getSoundManager().releaseAll();
    }

    public void runOnUpdateThread(Runnable runnable) {
        this.mEngine.runOnUpdateThread(runnable);
    }

    public class BaseWallpaperGLEngine
    extends GLWallpaperService.GLEngine {
        private GLSurfaceView.Renderer mRenderer;

        public BaseWallpaperGLEngine() {
            this.setEGLConfigChooser(false);
            this.mRenderer = new RenderSurfaceView.Renderer(BaseLiveWallpaperService.this.mEngine);
            this.setRenderer(this.mRenderer);
            this.setRenderMode(1);
        }

        /*
         * Enabled aggressive block sorting
         */
        public Bundle onCommand(String string, int n, int n2, int n3, Bundle bundle, boolean bl) {
            if (string.equals("android.wallpaper.tap")) {
                BaseLiveWallpaperService.this.onTap(n, n2);
                return super.onCommand(n, n2, n3, bundle, bl);
            } else {
                if (!string.equals("android.home.drop")) return super.onCommand(n, n2, n3, bundle, bl);
                BaseLiveWallpaperService.this.onDrop(n, n2);
            }
            return super.onCommand(n, n2, n3, bundle, bl);
        }

        public void onDestroy() {
            super.onDestroy();
            this.mRenderer = null;
        }

        public void onPause() {
            super.onPause();
            BaseLiveWallpaperService.this.getEngine().onPause();
            BaseLiveWallpaperService.this.onPause();
        }

        public void onResume() {
            super.onResume();
            BaseLiveWallpaperService.this.getEngine().onResume();
            BaseLiveWallpaperService.this.onResume();
        }
    }

}

