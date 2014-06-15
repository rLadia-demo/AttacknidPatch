package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public abstract class BaseTextureSourceDecorator
  implements ITextureSource
{
  protected final boolean mAntiAliasing;
  protected final Paint mPaint = new Paint();
  protected final ITextureSource mTextureSource;
  
  public BaseTextureSourceDecorator(ITextureSource paramITextureSource)
  {
    this(paramITextureSource, false);
  }
  
  public BaseTextureSourceDecorator(ITextureSource paramITextureSource, boolean paramBoolean)
  {
    this.mTextureSource = paramITextureSource;
    this.mAntiAliasing = paramBoolean;
    this.mPaint.setAntiAlias(paramBoolean);
  }
  
  private Bitmap ensureLoadedBitmapIsMutable(Bitmap paramBitmap)
  {
    if (paramBitmap.isMutable()) {
      return paramBitmap;
    }
    Bitmap localBitmap = paramBitmap.copy(paramBitmap.getConfig(), true);
    paramBitmap.recycle();
    return localBitmap;
  }
  
  public abstract BaseTextureSourceDecorator clone();
  
  public int getHeight()
  {
    return this.mTextureSource.getHeight();
  }
  
  public int getWidth()
  {
    return this.mTextureSource.getWidth();
  }
  
  protected abstract void onDecorateBitmap(Canvas paramCanvas);
  
  public Bitmap onLoadBitmap()
  {
    Bitmap localBitmap = ensureLoadedBitmapIsMutable(this.mTextureSource.onLoadBitmap());
    onDecorateBitmap(new Canvas(localBitmap));
    return localBitmap;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.BaseTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */