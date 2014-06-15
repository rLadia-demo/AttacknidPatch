package org.anddev.andengine.opengl.texture;

public class TextureOptions
{
  public static final TextureOptions BILINEAR;
  public static final TextureOptions BILINEAR_PREMULTIPLYALPHA;
  public static final TextureOptions DEFAULT = NEAREST_PREMULTIPLYALPHA;
  public static final TextureOptions NEAREST = new TextureOptions(9728, 9728, 33071, 33071, 8448, false);
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
  
  static
  {
    BILINEAR = new TextureOptions(9729, 9729, 33071, 33071, 8448, false);
    REPEATING = new TextureOptions(9728, 9728, 10497, 10497, 8448, false);
    REPEATING_BILINEAR = new TextureOptions(9729, 9729, 10497, 10497, 8448, false);
    NEAREST_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 33071, 33071, 8448, true);
    BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 33071, 33071, 8448, true);
    REPEATING_PREMULTIPLYALPHA = new TextureOptions(9728, 9728, 10497, 10497, 8448, true);
    REPEATING_BILINEAR_PREMULTIPLYALPHA = new TextureOptions(9729, 9729, 10497, 10497, 8448, true);
  }
  
  public TextureOptions(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, boolean paramBoolean)
  {
    this.mMinFilter = paramInt1;
    this.mMagFilter = paramInt2;
    this.mWrapT = paramInt3;
    this.mWrapS = paramInt4;
    this.mTextureEnvironment = paramInt5;
    this.mPreMultipyAlpha = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.TextureOptions
 * JD-Core Version:    0.7.0.1
 */