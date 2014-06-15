package org.anddev.andengine.opengl.texture.source.decorator;

import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RadialGradient;
import android.graphics.Shader.TileMode;
import org.anddev.andengine.opengl.texture.source.ITextureSource;

public class RadialGradientFillTextureSourceDecorator
  extends BaseShapeTextureSourceDecorator
{
  protected final int mFromColor;
  protected final RadialGradientDirection mRadialGradientDirection;
  protected final int mToColor;
  
  public RadialGradientFillTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt1, int paramInt2, RadialGradientDirection paramRadialGradientDirection)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt1, paramInt2, paramRadialGradientDirection);
  }
  
  public RadialGradientFillTextureSourceDecorator(ITextureSource paramITextureSource, int paramInt1, int paramInt2, RadialGradientDirection paramRadialGradientDirection, boolean paramBoolean)
  {
    this(paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape.RECTANGLE, paramInt1, paramInt2, paramRadialGradientDirection, paramBoolean);
  }
  
  public RadialGradientFillTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt1, int paramInt2, RadialGradientDirection paramRadialGradientDirection)
  {
    this(paramITextureSource, paramTextureSourceDecoratorShape, paramInt1, paramInt2, paramRadialGradientDirection, false);
  }
  
  public RadialGradientFillTextureSourceDecorator(ITextureSource paramITextureSource, BaseShapeTextureSourceDecorator.TextureSourceDecoratorShape paramTextureSourceDecoratorShape, int paramInt1, int paramInt2, RadialGradientDirection paramRadialGradientDirection, boolean paramBoolean)
  {
    super(paramITextureSource, paramTextureSourceDecoratorShape, paramBoolean);
    this.mFromColor = paramInt1;
    this.mToColor = paramInt2;
    this.mRadialGradientDirection = paramRadialGradientDirection;
    this.mPaint.setStyle(Paint.Style.FILL);
    int i = paramITextureSource.getWidth();
    int j = paramITextureSource.getHeight();
    float f1 = 0.5F * i;
    float f2 = 0.5F * j;
    float f3 = Math.max(f1, f2);
    switch (paramRadialGradientDirection)
    {
    default: 
      return;
    case INSIDE_OUT: 
      this.mPaint.setShader(new RadialGradient(f1, f2, f3, paramInt1, paramInt2, Shader.TileMode.CLAMP));
      return;
    }
    this.mPaint.setShader(new RadialGradient(f1, f2, f3, paramInt2, paramInt1, Shader.TileMode.CLAMP));
  }
  
  public RadialGradientFillTextureSourceDecorator clone()
  {
    return new RadialGradientFillTextureSourceDecorator(this.mTextureSource, this.mTextureSourceDecoratorShape, this.mFromColor, this.mToColor, this.mRadialGradientDirection, this.mAntiAliasing);
  }
  
  public static enum RadialGradientDirection
  {
    OUTSIDE_IN,  INSIDE_OUT;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.decorator.RadialGradientFillTextureSourceDecorator
 * JD-Core Version:    0.7.0.1
 */