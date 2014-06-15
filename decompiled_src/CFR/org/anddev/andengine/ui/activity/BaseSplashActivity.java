/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.content.Intent
 */
package org.anddev.andengine.ui.activity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.engine.options.EngineOptions;
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
import org.anddev.andengine.ui.activity.BaseGameActivity;

public abstract class BaseSplashActivity
extends BaseGameActivity {
    private Camera mCamera;
    private TextureRegion mLoadingScreenTextureRegion;
    private ITextureSource mSplashTextureSource;

    protected abstract Class<? extends Activity> getFollowUpActivity();

    protected abstract EngineOptions.ScreenOrientation getScreenOrientation();

    protected Camera getSplashCamera(int n, int n2) {
        return new Camera(0.0f, 0.0f, n, n2);
    }

    protected abstract float getSplashDuration();

    protected IResolutionPolicy getSplashResolutionPolicy(int n, int n2) {
        return new RatioResolutionPolicy(n, n2);
    }

    protected float getSplashScaleFrom() {
        return 1.0f;
    }

    protected float getSplashScaleTo() {
        return 1.0f;
    }

    protected abstract ITextureSource onGetSplashTextureSource();

    public void onLoadComplete() {
    }

    public Engine onLoadEngine() {
        this.mSplashTextureSource = this.onGetSplashTextureSource();
        int n = this.mSplashTextureSource.getWidth();
        int n2 = this.mSplashTextureSource.getHeight();
        this.mCamera = this.getSplashCamera(n, n2);
        return new Engine(new EngineOptions(true, this.getScreenOrientation(), this.getSplashResolutionPolicy(n, n2), this.mCamera));
    }

    public void onLoadResources() {
        Texture texture = TextureFactory.createForTextureSourceSize(this.mSplashTextureSource, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mLoadingScreenTextureRegion = TextureRegionFactory.createFromSource(texture, this.mSplashTextureSource, 0, 0);
        this.getEngine().getTextureManager().loadTexture(texture);
    }

    public Scene onLoadScene() {
        float f = this.getSplashDuration();
        SplashScene splashScene = new SplashScene(this.mCamera, this.mLoadingScreenTextureRegion, f, this.getSplashScaleFrom(), this.getSplashScaleTo());
        splashScene.registerUpdateHandler((IUpdateHandler)new TimerHandler(f, new ITimerCallback(){

            @Override
            public void onTimePassed(TimerHandler timerHandler) {
                BaseSplashActivity.this.startActivity(new Intent((Context)BaseSplashActivity.this, BaseSplashActivity.this.getFollowUpActivity()));
                BaseSplashActivity.this.finish();
            }
        }));
        return splashScene;
    }

}

