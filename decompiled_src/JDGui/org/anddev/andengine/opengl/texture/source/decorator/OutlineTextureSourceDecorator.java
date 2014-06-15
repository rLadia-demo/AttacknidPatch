package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Paint;
import android.graphics.Paint.Style;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class OutlineTextureSourceDecorator
  extends BaseShapeTextureSourceDecorator
{
  protected final int mOutlineColor;
  
  public OutlineTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt);
  }
  
  public OutlineTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt, boolean paramBoolean)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt, paramBoolean);
  }
  
  public OutlineTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt)
  {
    this(paramITextureSource, paramTextureSourceDecoratorShape, paramInt, false);
  }
  
  public OutlineTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt, boolean paramBoolean)
  {
    super(paramITextureSource, paramTextureSourceDecoratorShape, paramBoolean);
    this.mOutlineColor = paramInt;
    this.mPaint.setStyle(Paint.Style.STROKE);
    this.mPaint.setColor(paramInt);
  }
  
  public OutlineTextureSourceDecorator clone()
  {
    return new OutlineTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mOutlineColor, this.mAntiAliasing);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.OutlineTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */