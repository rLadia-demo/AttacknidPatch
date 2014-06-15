package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Paint;
import android.graphics.Paint.Style;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class FillTextureSourceDecorator
  extends BaseShapeTextureSourceDecorator
{
  protected final int mFillColor;
  
  public FillTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt);
  }
  
  public FillTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt, boolean paramBoolean)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt, paramBoolean);
  }
  
  public FillTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt)
  {
    this(paramITextureSource, paramTextureSourceDecoratorShape, paramInt, false);
  }
  
  public FillTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt, boolean paramBoolean)
  {
    super(paramITextureSource, paramTextureSourceDecoratorShape, paramBoolean);
    this.mFillColor = paramInt;
    this.mPaint.setStyle(Paint.Style.FILL);
    this.mPaint.setColor(paramInt);
  }
  
  public FillTextureSourceDecorator clone()
  {
    return new FillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFillColor, this.mAntiAliasing);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.FillTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */