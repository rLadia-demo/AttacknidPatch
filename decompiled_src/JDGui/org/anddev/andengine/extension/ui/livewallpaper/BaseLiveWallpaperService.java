package org.anddev.andengine.extension.ui.livewallpaper;

import android.os.Bundle;
import android.os.SystemClock;
import android.service.wallpaper.WallpaperService.Engine;
import android.view.MotionEvent;
import net.rbgrn.opengl.GLWallpaperService;
import net.rbgrn.opengl.GLWallpaperService.GLEngine;
import org.anddev.andengine.audio.music.MusicManager;
import org.anddev.andengine.audio.sound.SoundManager;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.opengl.view.GLSurfaceView.Renderer;
import org.anddev.andengine.opengl.view.RenderSurfaceView.Renderer;
import org.anddev.andengine.sensor.accelerometer.AccelerometerSensorOptions;
import org.anddev.andengine.sensor.accelerometer.IAccelerometerListener;
import org.anddev.andengine.sensor.location.ILocationListener;
import org.anddev.andengine.sensor.location.LocationSensorOptions;
import org.anddev.andengine.sensor.orientation.IOrientationListener;
import org.anddev.andengine.sensor.orientation.OrientationSensorOptions;
import org.anddev.andengine.ui.IGameInterface;

public abstract class BaseLiveWallpaperService
  extends GLWallpaperService
  implements IGameInterface
{
  protected Engine mEngine;
  
  protected void applyEngineOptions(EngineOptions paramEngineOptions) {}
  
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
  
  protected boolean enableVibrator()
  {
    return this.mEngine.enableVibrator(this);
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
  
  public void onCreate()
  {
    super.onCreate();
    this.mEngine = onLoadEngine();
    applyEngineOptions(this.mEngine.getEngineOptions());
    onLoadResources();
    Scene localScene = onLoadScene();
    this.mEngine.onLoadComplete(localScene);
    onLoadComplete();
    this.mEngine.start();
  }
  
  public WallpaperService.Engine onCreateEngine()
  {
    return new BaseWallpaperGLEngine();
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    this.mEngine.interruptUpdateThread();
    onUnloadResources();
  }
  
  protected void onDrop(int paramInt1, int paramInt2) {}
  
  public void onGamePaused() {}
  
  public void onGameResumed() {}
  
  protected void onPause()
  {
    this.mEngine.stop();
    onGamePaused();
  }
  
  protected void onResume()
  {
    this.mEngine.start();
    onGameResumed();
  }
  
  protected void onTap(int paramInt1, int paramInt2)
  {
    this.mEngine.onTouch(null, MotionEvent.obtain(SystemClock.uptimeMillis(), SystemClock.uptimeMillis(), 0, paramInt1, paramInt2, 0));
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
  
  public void runOnUpdateThread(Runnable paramRunnable)
  {
    this.mEngine.runOnUpdateThread(paramRunnable);
  }
  
  protected class BaseWallpaperGLEngine
    extends GLWallpaperService.GLEngine
  {
    private GLSurfaceView.Renderer mRenderer;
    
    public BaseWallpaperGLEngine()
    {
      super();
      setEGLConfigChooser(false);
      this.mRenderer = new RenderSurfaceView.Renderer(BaseLiveWallpaperService.this.mEngine);
      setRenderer(this.mRenderer);
      setRenderMode(1);
    }
    
    public Bundle onCommand(String paramString, int paramInt1, int paramInt2, int paramInt3, Bundle paramBundle, boolean paramBoolean)
    {
      if (paramString.equals("android.wallpaper.tap")) {
        BaseLiveWallpaperService.this.onTap(paramInt1, paramInt2);
      }
      for (;;)
      {
        return super.onCommand(paramString, paramInt1, paramInt2, paramInt3, paramBundle, paramBoolean);
        if (paramString.equals("android.home.drop")) {
          BaseLiveWallpaperService.this.onDrop(paramInt1, paramInt2);
        }
      }
    }
    
    public void onDestroy()
    {
      super.onDestroy();
      this.mRenderer = null;
    }
    
    public void onPause()
    {
      super.onPause();
      BaseLiveWallpaperService.this.getEngine().onPause();
      BaseLiveWallpaperService.this.onPause();
    }
    
    public void onResume()
    {
      super.onResume();
      BaseLiveWallpaperService.this.getEngine().onResume();
      BaseLiveWallpaperService.this.onResume();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.ui.livewallpaper.BaseLiveWallpaperService
 * JD-Core Version:    0.7.0.1
 */