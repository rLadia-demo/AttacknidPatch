package org.anddev.andengine.opengl.texture.source;

import android.graphics.Bitmap;

public abstract interface ITextureSource
  extends Cloneable
{
  public abstract ITextureSource clone();
  
  public abstract int getHeight();
  
  public abstract int getWidth();
  
  public abstract Bitmap onLoadBitmap();
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.ITextureSource
 * JD-Core Version:    0.7.0.1
 */