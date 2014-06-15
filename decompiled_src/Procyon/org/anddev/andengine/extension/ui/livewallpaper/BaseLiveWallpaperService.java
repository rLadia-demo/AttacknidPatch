package org.anddev.andengine.extension.ui.livewallpaper;

import net.rbgrn.opengl.*;
import org.anddev.andengine.ui.*;
import org.anddev.andengine.engine.*;
import org.anddev.andengine.engine.options.*;
import android.content.*;
import org.anddev.andengine.sensor.accelerometer.*;
import org.anddev.andengine.sensor.location.*;
import org.anddev.andengine.sensor.orientation.*;
import org.anddev.andengine.audio.music.*;
import org.anddev.andengine.audio.sound.*;
import android.service.wallpaper.*;
import android.view.*;
import org.anddev.andengine.opengl.view.*;
import android.os.*;

public abstract class BaseLiveWallpaperService extends GLWallpaperService implements IGameInterface
{
    protected Engine mEngine;
    
    protected void applyEngineOptions(final EngineOptions engineOptions) {
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
    
    @Override
    public void onCreate() {
        super.onCreate();
        this.mEngine = this.onLoadEngine();
        this.applyEngineOptions(this.mEngine.getEngineOptions());
        this.onLoadResources();
        this.mEngine.onLoadComplete(this.onLoadScene());
        this.onLoadComplete();
        this.mEngine.start();
    }
    
    @Override
    public WallpaperService$Engine onCreateEngine() {
        return new BaseWallpaperGLEngine();
    }
    
    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mEngine.interruptUpdateThread();
        this.onUnloadResources();
    }
    
    protected void onDrop(final int n, final int n2) {
    }
    
    @Override
    public void onGamePaused() {
    }
    
    @Override
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
    
    protected void onTap(final int n, final int n2) {
        this.mEngine.onTouch(null, MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 0, (float)n, (float)n2, 0));
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
    
    public void runOnUpdateThread(final Runnable runnable) {
        this.mEngine.runOnUpdateThread(runnable);
    }
    
    protected class BaseWallpaperGLEngine extends GLEngine
    {
        private GLSurfaceView.Renderer mRenderer;
        
        public BaseWallpaperGLEngine() {
            super();
            ((GLEngine)this).setEGLConfigChooser(false);
            ((GLEngine)this).setRenderer(this.mRenderer = new RenderSurfaceView.Renderer(BaseLiveWallpaperService.this.mEngine));
            ((GLEngine)this).setRenderMode(1);
        }
        
        public Bundle onCommand(final String s, final int n, final int n2, final int n3, final Bundle bundle, final boolean b) {
            if (s.equals("android.wallpaper.tap")) {
                BaseLiveWallpaperService.this.onTap(n, n2);
            }
            else if (s.equals("android.home.drop")) {
                BaseLiveWallpaperService.this.onDrop(n, n2);
            }
            return super.onCommand(s, n, n2, n3, bundle, b);
        }
        
        @Override
        public void onDestroy() {
            super.onDestroy();
            this.mRenderer = null;
        }
        
        @Override
        public void onPause() {
            super.onPause();
            BaseLiveWallpaperService.this.getEngine().onPause();
            BaseLiveWallpaperService.this.onPause();
        }
        
        @Override
        public void onResume() {
            super.onResume();
            BaseLiveWallpaperService.this.getEngine().onResume();
            BaseLiveWallpaperService.this.onResume();
        }
    }
}
