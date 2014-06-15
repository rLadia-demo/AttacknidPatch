package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class FadeOutModifier
  extends AlphaModifier
{
  public FadeOutModifier(float paramFloat)
  {
    super(paramFloat, 1.0F, 0.0F, IEaseFunction.DEFAULT);
  }
  
  public FadeOutModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat, 1.0F, 0.0F, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public FadeOutModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat, 1.0F, 0.0F, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public FadeOutModifier(float paramFloat, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat, 1.0F, 0.0F, paramIEaseFunction);
  }
  
  protected FadeOutModifier(FadeOutModifier paramFadeOutModifier)
  {
    super(paramFadeOutModifier);
  }
  
  public FadeOutModifier clone()
  {
    return new FadeOutModifier(this);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.FadeOutModifier
 * JD-Core Version:    0.7.0.1
 */