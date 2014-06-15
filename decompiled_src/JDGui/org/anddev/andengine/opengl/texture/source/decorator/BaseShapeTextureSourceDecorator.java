package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public abstract class BaseShapeTextureSourceDecorator
  extends BaseTextureSourceDecorator
{
  protected final TextureSourceDecoratorShape mTextureSourceDecoratorShape;
  
  public BaseShapeTextureSourceDecorator(ITextureSource paramITextureSource, TextureSourceDecoratorShape paramTextureSourceDecoratorShape)
  {
    super(paramITextureSource);
    this.mTextureSourceDecoratorShape = paramTextureSourceDecoratorShape;
  }
  
  public BaseShapeTextureSourceDecorator(ITextureSource paramITextureSource, TextureSourceDecoratorShape paramTextureSourceDecoratorShape, boolean paramBoolean)
  {
    super(paramITextureSource, paramBoolean);
    this.mTextureSourceDecoratorShape = paramTextureSourceDecoratorShape;
  }
  
  public abstract BaseShapeTextureSourceDecorator clone();
  
  protected void onDecorateBitmap(Canvas paramCanvas)
  {
    this.mTextureSourceDecoratorShape.onDecorateBitmap(paramCanvas, this.mPaint);
  }
  
  public static abstract enum TextureSourceDecoratorShape
  {
    RECTANGLE,  ELLIPSE,  CIRCLE;
    
    public abstract void onDecorateBitmap(Canvas paramCanvas, Paint paramPaint);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.BaseShapeTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */