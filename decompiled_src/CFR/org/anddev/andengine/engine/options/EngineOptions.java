/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.options;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.options.RenderOptions;
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.engine.options.WakeLockOptions;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class EngineOptions {
    private final Camera mCamera;
    private final boolean mFullscreen;
    private ITextureSource mLoadingScreenTextureSource;
    private boolean mNeedsMusic;
    private boolean mNeedsSound;
    private final RenderOptions mRenderOptions = new RenderOptions();
    private final IResolutionPolicy mResolutionPolicy;
    private final ScreenOrientation mScreenOrientation;
    private final TouchOptions mTouchOptions = new TouchOptions();
    private WakeLockOptions mWakeLockOptions = WakeLockOptions.SCREEN_BRIGHT;

    public EngineOptions(boolean bl, ScreenOrientation screenOrientation, IResolutionPolicy iResolutionPolicy, Camera camera) {
        this.mFullscreen = bl;
        this.mScreenOrientation = screenOrientation;
        this.mResolutionPolicy = iResolutionPolicy;
        this.mCamera = camera;
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
        if (this.mLoadingScreenTextureSource == null) return false;
        return true;
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

    public EngineOptions setLoadingScreenTextureSource(ITextureSource iTextureSource) {
        this.mLoadingScreenTextureSource = iTextureSource;
        return this;
    }

    public EngineOptions setNeedsMusic(boolean bl) {
        this.mNeedsMusic = bl;
        return this;
    }

    public EngineOptions setNeedsSound(boolean bl) {
        this.mNeedsSound = bl;
        return this;
    }

    public EngineOptions setWakeLockOptions(WakeLockOptions wakeLockOptions) {
        this.mWakeLockOptions = wakeLockOptions;
        return this;
    }

    public static final class ScreenOrientation
    extends Enum<ScreenOrientation> {
        private static final /* synthetic */ ScreenOrientation[] ENUM$VALUES;
        public static final /* enum */ ScreenOrientation LANDSCAPE = new ScreenOrientation("LANDSCAPE", 0);
        public static final /* enum */ ScreenOrientation PORTRAIT = new ScreenOrientation("PORTRAIT", 1);

        static {
            ScreenOrientation[] arrscreenOrientation = new ScreenOrientation[]{ScreenOrientation.LANDSCAPE, ScreenOrientation.PORTRAIT};
            ScreenOrientation.ENUM$VALUES = arrscreenOrientation;
        }

        private ScreenOrientation(String string22, int string22) {
            super(string, n);
        }

        public static ScreenOrientation valueOf(String string) {
            return (ScreenOrientation)Enum.valueOf(ScreenOrientation.class, string);
        }

        public static ScreenOrientation[] values() {
            ScreenOrientation[] arrscreenOrientation = ScreenOrientation.ENUM$VALUES;
            int n = arrscreenOrientation.length;
            ScreenOrientation[] arrscreenOrientation2 = new ScreenOrientation[n];
            System.arraycopy(arrscreenOrientation, 0, arrscreenOrientation2, 0, n);
            return arrscreenOrientation2;
        }
    }

}

