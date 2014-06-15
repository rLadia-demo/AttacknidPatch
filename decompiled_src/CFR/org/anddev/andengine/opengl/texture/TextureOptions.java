/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture;

public class TextureOptions {
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
        TextureOptions.NEAREST = new TextureOptions(9728, 9728, 33071, 33071, 8448, false);
        TextureOptions.BILINEAR = new TextureOptions(9729, 9729, 33071, 33071, 8448, false);
        TextureOptions.REPEATING = new TextureOptions(9728, 9728, 10497, 10497, 8448, false);
        TextureOptions.REPEATING_BILINEAR = new TextureOptions(9729, 9729, 10497, 10497, 8448, false);
        TextureOptions.NEAREST_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 33071, 33071, 8448, true);
        TextureOptions.BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 33071, 33071, 8448, true);
        TextureOptions.REPEATING_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 10497, 10497, 8448, true);
        TextureOptions.REPEATING_BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 10497, 10497, 8448, true);
        TextureOptions.DEFAULT = TextureOptions.NEAREST_PREMULTIPLYALPHA;
    }

    public TextureOptions(int n, int n2, int n3, int n4, int n5, boolean bl) {
        this.mMinFilter = n;
        this.mMagFilter = n2;
        this.mWrapT = n3;
        this.mWrapS = n4;
        this.mTextureEnvironment = n5;
        this.mPreMultipyAlpha = bl;
    }
}

