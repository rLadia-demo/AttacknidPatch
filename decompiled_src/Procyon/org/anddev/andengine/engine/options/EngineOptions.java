package org.anddev.andengine.engine.options;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.engine.options.resolutionpolicy.*;

public class EngineOptions
{
    private final Camera mCamera;
    private final boolean mFullscreen;
    private ITextureSource mLoadingScreenTextureSource;
    private boolean mNeedsMusic;
    private boolean mNeedsSound;
    private final RenderOptions mRenderOptions;
    private final IResolutionPolicy mResolutionPolicy;
    private final ScreenOrientation mScreenOrientation;
    private final TouchOptions mTouchOptions;
    private WakeLockOptions mWakeLockOptions;
    
    public EngineOptions(final boolean mFullscreen, final ScreenOrientation mScreenOrientation, final IResolutionPolicy mResolutionPolicy, final Camera mCamera) {
        super();
        this.mTouchOptions = new TouchOptions();
        this.mRenderOptions = new RenderOptions();
        this.mWakeLockOptions = WakeLockOptions.SCREEN_BRIGHT;
        this.mFullscreen = mFullscreen;
        this.mScreenOrientation = mScreenOrientation;
        this.mResolutionPolicy = mResolutionPolicy;
        this.mCamera = mCamera;
    }
    
    public Camera getCamera() {
        return this.mCamera;
    }
    
    public ITextureSource getLoadingScreenTextureSource() {
        return this.mLoadingScreenTextureSource;
    }
    
    public RenderOptions getRenderOptions() {
        return this.mRenderOptions;
    }
    
    public IResolutionPolicy getResolutionPolicy() {
        return this.mResolutionPolicy;
    }
    
    public ScreenOrientation getScreenOrientation() {
        return this.mScreenOrientation;
    }
    
    public TouchOptions getTouchOptions() {
        return this.mTouchOptions;
    }
    
    public WakeLockOptions getWakeLockOptions() {
        return this.mWakeLockOptions;
    }
    
    public boolean hasLoadingScreen() {
        return this.mLoadingScreenTextureSource != null;
    }
    
    public boolean isFullscreen() {
        return this.mFullscreen;
    }
    
    public boolean needsMusic() {
        return this.mNeedsMusic;
    }
    
    public boolean needsSound() {
        return this.mNeedsSound;
    }
    
    public EngineOptions setLoadingScreenTextureSource(final ITextureSource mLoadingScreenTextureSource) {
        this.mLoadingScreenTextureSource = mLoadingScreenTextureSource;
        return this;
    }
    
    public EngineOptions setNeedsMusic(final boolean mNeedsMusic) {
        this.mNeedsMusic = mNeedsMusic;
        return this;
    }
    
    public EngineOptions setNeedsSound(final boolean mNeedsSound) {
        this.mNeedsSound = mNeedsSound;
        return this;
    }
    
    public EngineOptions setWakeLockOptions(final WakeLockOptions mWakeLockOptions) {
        this.mWakeLockOptions = mWakeLockOptions;
        return this;
    }
    
    public enum ScreenOrientation
    {
        LANDSCAPE("LANDSCAPE", 0), 
        PORTRAIT("PORTRAIT", 1);
    }
}
