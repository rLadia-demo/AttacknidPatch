package org.anddev.andengine.opengl.texture.source;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;

public class EmptyBitmapTextureSource
  implements ITextureSource
{
  private final int mHeight;
  private final int mWidth;
  
  public EmptyBitmapTextureSource(int paramInt1, int paramInt2)
  {
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }
  
  public EmptyBitmapTextureSource clone()
  {
    return new EmptyBitmapTextureSource(this.mWidth, this.mHeight);
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  public Bitmap onLoadBitmap()
  {
    return Bitmap.createBitmap(this.mWidth, this.mHeight, Bitmap.Config.ARGB_8888);
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + this.mWidth + " x " + this.mHeight + ")";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.EmptyBitmapTextureSource
 * JD-Core Version:    0.7.0.1
 */