package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.BaseTripleValueSpanModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ColorModifier
  extends BaseTripleValueSpanModifier<IBackground>
  implements IBackgroundModifier
{
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, null, IEaseFunction.DEFAULT);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIBackgroundModifierListener, IEaseFunction.DEFAULT);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIBackgroundModifierListener, paramIEaseFunction);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, null, paramIEaseFunction);
  }
  
  protected ColorModifier(ColorModifier paramColorModifier)
  {
    super(paramColorModifier);
  }
  
  public ColorModifier clone()
  {
    return new ColorModifier(this);
  }
  
  protected void onSetInitialValues(IBackground paramIBackground, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramIBackground.setColor(paramFloat1, paramFloat2, paramFloat3);
  }
  
  protected void onSetValues(IBackground paramIBackground, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    paramIBackground.setColor(paramFloat2, paramFloat3, paramFloat4);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.modifier.ColorModifier
 * JD-Core Version:    0.7.0.1
 */