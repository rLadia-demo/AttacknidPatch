package org.anddev.andengine.ui.activity;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.source.*;
import android.app.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.engine.options.resolutionpolicy.*;
import org.anddev.andengine.engine.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.engine.handler.timer.*;
import android.content.*;
import org.anddev.andengine.engine.handler.*;

public abstract class BaseSplashActivity extends BaseGameActivity
{
    private Camera mCamera;
    private TextureRegion mLoadingScreenTextureRegion;
    private ITextureSource mSplashTextureSource;
    
    protected abstract Class<? extends Activity> getFollowUpActivity();
    
    protected abstract EngineOptions.ScreenOrientation getScreenOrientation();
    
    protected Camera getSplashCamera(final int n, final int n2) {
        return new Camera(0.0f, 0.0f, n, n2);
    }
    
    protected abstract float getSplashDuration();
    
    protected IResolutionPolicy getSplashResolutionPolicy(final int n, final int n2) {
        return new RatioResolutionPolicy(n, n2);
    }
    
    protected float getSplashScaleFrom() {
        return 1.0f;
    }
    
    protected float getSplashScaleTo() {
        return 1.0f;
    }
    
    protected abstract ITextureSource onGetSplashTextureSource();
    
    @Override
    public void onLoadComplete() {
    }
    
    @Override
    public Engine onLoadEngine() {
        this.mSplashTextureSource = this.onGetSplashTextureSource();
        final int width = this.mSplashTextureSource.getWidth();
        final int height = this.mSplashTextureSource.getHeight();
        this.mCamera = this.getSplashCamera(width, height);
        return new Engine(new EngineOptions(true, this.getScreenOrientation(), this.getSplashResolutionPolicy(width, height), this.mCamera));
    }
    
    @Override
    public void onLoadResources() {
        final Texture forTextureSourceSize = TextureFactory.createForTextureSourceSize(this.mSplashTextureSource, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mLoadingScreenTextureRegion = TextureRegionFactory.createFromSource(forTextureSourceSize, this.mSplashTextureSource, 0, 0);
        this.getEngine().getTextureManager().loadTexture(forTextureSourceSize);
    }
    
    @Override
    public Scene onLoadScene() {
        final float splashDuration = this.getSplashDuration();
        final SplashScene splashScene = new SplashScene(this.mCamera, this.mLoadingScreenTextureRegion, splashDuration, this.getSplashScaleFrom(), this.getSplashScaleTo());
        splashScene.registerUpdateHandler(new TimerHandler(splashDuration, new ITimerCallback() {
            @Override
            public void onTimePassed(final TimerHandler timerHandler) {
                BaseSplashActivity.this.startActivity(new Intent((Context)BaseSplashActivity.this, (Class)BaseSplashActivity.this.getFollowUpActivity()));
                BaseSplashActivity.this.finish();
            }
        }));
        return splashScene;
    }
}
