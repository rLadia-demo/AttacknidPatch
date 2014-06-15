package org.anddev.andengine.opengl.texture;

public class TextureOptions
{
    public static final TextureOptions BILINEAR;
    public static final TextureOptions BILINEAR_PREMULTIPLYALPHA;
    public static final TextureOptions DEFAULT;
    public static final TextureOptions NEAREST;
    public static final TextureOptions NEAREST_PREMULTIPLYALPHA;
    public static final TextureOptions REPEATING;
    public static final TextureOptions REPEATING_BILINEAR;
    public static final TextureOptions REPEATING_BILINEAR_PREMULTIPLYALPHA;
    public static final TextureOptions REPEATING_PREMULTIPLYALPHA;
    public final int mMagFilter;
    public final int mMinFilter;
    public final boolean mPreMultipyAlpha;
    public final int mTextureEnvironment;
    public final float mWrapS;
    public final float mWrapT;
    
    static {
        NEAREST = new TextureOptions(9728, 9728, 33071, 33071, 8448, false);
        BILINEAR = new TextureOptions(9729, 9729, 33071, 33071, 8448, false);
        REPEATING = new TextureOptions(9728, 9728, 10497, 10497, 8448, false);
        REPEATING_BILINEAR = new TextureOptions(9729, 9729, 10497, 10497, 8448, false);
        NEAREST_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 33071, 33071, 8448, true);
        BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 33071, 33071, 8448, true);
        REPEATING_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 10497, 10497, 8448, true);
        REPEATING_BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 10497, 10497, 8448, true);
        DEFAULT = TextureOptions.NEAREST_PREMULTIPLYALPHA;
    }
    
    public TextureOptions(final int mMinFilter, final int mMagFilter, final int n, final int n2, final int mTextureEnvironment, final boolean mPreMultipyAlpha) {
        super();
        this.mMinFilter = mMinFilter;
        this.mMagFilter = mMagFilter;
        this.mWrapT = n;
        this.mWrapS = n2;
        this.mTextureEnvironment = mTextureEnvironment;
        this.mPreMultipyAlpha = mPreMultipyAlpha;
    }
}
