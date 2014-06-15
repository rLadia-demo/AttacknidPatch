package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.AvoidXfermode;
import android.graphics.AvoidXfermode.Mode;
import android.graphics.Paint;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class ColorKeyTextureSourceDecorator
  extends BaseShapeTextureSourceDecorator
{
  private static final int TOLERANCE_DEFAULT;
  private final int mColorKeyColor;
  
  public ColorKeyTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt);
  }
  
  public ColorKeyTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt1, int paramInt2)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt1, paramInt2);
  }
  
  public ColorKeyTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt)
  {
    this(paramITextureSource, paramTextureSourceDecoratorShape, paramInt, 0);
  }
  
  public ColorKeyTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt1, int paramInt2)
  {
    super(paramITextureSource, paramTextureSourceDecoratorShape);
    this.mColorKeyColor = paramInt1;
    this.mPaint.setXfermode(new AvoidXfermode(paramInt1, paramInt2, AvoidXfermode.Mode.TARGET));
    this.mPaint.setColor(0);
  }
  
  public ColorKeyTextureSourceDecorator clone()
  {
    return new ColorKeyTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mColorKeyColor);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.ColorKeyTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */