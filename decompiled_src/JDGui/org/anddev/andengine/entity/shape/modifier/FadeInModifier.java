package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class FadeInModifier
  extends AlphaModifier
{
  public FadeInModifier(float paramFloat)
  {
    super(paramFloat, 0.0F, 1.0F, IEaseFunction.DEFAULT);
  }
  
  public FadeInModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat, 0.0F, 1.0F, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public FadeInModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat, 0.0F, 1.0F, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public FadeInModifier(float paramFloat, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat, 0.0F, 1.0F, paramIEaseFunction);
  }
  
  protected FadeInModifier(FadeInModifier paramFadeInModifier)
  {
    super(paramFadeInModifier);
  }
  
  public FadeInModifier clone()
  {
    return new FadeInModifier(this);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.FadeInModifier
 * JD-Core Version:    0.7.0.1
 */