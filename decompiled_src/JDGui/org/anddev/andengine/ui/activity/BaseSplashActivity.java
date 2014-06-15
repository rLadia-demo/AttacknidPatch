package org.anddev.andengine.ui.activity;

import android.app.Activity;
import android.content.Intent;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.EngineOptions.ScreenOrientation;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;
import org.anddev.andengine.engine.options.resolutionpolicy.RatioResolutionPolicy;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.SplashScene;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureFactory;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public abstract class BaseSplashActivity
  extends BaseGameActivity
{
  private Camera mCamera;
  private TextureRegion mLoadingScreenTextureRegion;
  private ITextureSource mSplashTextureSource;
  
  protected abstract Class<? extends Activity> getFollowUpActivity();
  
  protected abstract EngineOptions.ScreenOrientation getScreenOrientation();
  
  protected Camera getSplashCamera(int paramInt1, int paramInt2)
  {
    return new Camera(0.0F, 0.0F, paramInt1, paramInt2);
  }
  
  protected abstract float getSplashDuration();
  
  protected IResolutionPolicy getSplashResolutionPolicy(int paramInt1, int paramInt2)
  {
    return new RatioResolutionPolicy(paramInt1, paramInt2);
  }
  
  protected float getSplashScaleFrom()
  {
    return 1.0F;
  }
  
  protected float getSplashScaleTo()
  {
    return 1.0F;
  }
  
  protected abstract ITextureSource onGetSplashTextureSource();
  
  public void onLoadComplete() {}
  
  public Engine onLoadEngine()
  {
    this.mSplashTextureSource = onGetSplashTextureSource();
    int i = this.mSplashTextureSource.getWidth();
    int j = this.mSplashTextureSource.getHeight();
    this.mCamera = getSplashCamera(i, j);
    return new Engine(new EngineOptions(true, getScreenOrientation(), getSplashResolutionPolicy(i, j), this.mCamera));
  }
  
  public void onLoadResources()
  {
    Texture localTexture = TextureFactory.createForTextureSourceSize(this.mSplashTextureSource, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
    this.mLoadingScreenTextureRegion = TextureRegionFactory.createFromSource(localTexture, this.mSplashTextureSource, 0, 0);
    getEngine().getTextureManager().loadTexture(localTexture);
  }
  
  public Scene onLoadScene()
  {
    float f = getSplashDuration();
    SplashScene localSplashScene = new SplashScene(this.mCamera, this.mLoadingScreenTextureRegion, f, getSplashScaleFrom(), getSplashScaleTo());
    localSplashScene.registerUpdateHandler(new TimerHandler(f, new ITimerCallback()
    {
      public void onTimePassed(TimerHandler paramAnonymousTimerHandler)
      {
        BaseSplashActivity.this.startActivity(new Intent(BaseSplashActivity.this, BaseSplashActivity.this.getFollowUpActivity()));
        BaseSplashActivity.this.finish();
      }
    }));
    return localSplashScene;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.ui.activity.BaseSplashActivity
 * JD-Core Version:    0.7.0.1
 */