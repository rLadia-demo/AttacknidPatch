package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class AlphaModifier
  extends SingleValueSpanShapeModifier
{
  public AlphaModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public AlphaModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public AlphaModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public AlphaModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected AlphaModifier(AlphaModifier paramAlphaModifier)
  {
    super(paramAlphaModifier);
  }
  
  public AlphaModifier clone()
  {
    return new AlphaModifier(this);
  }
  
  protected void onSetInitialValue(IShape paramIShape, float paramFloat)
  {
    paramIShape.setAlpha(paramFloat);
  }
  
  protected void onSetValue(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setAlpha(paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.AlphaModifier
 * JD-Core Version:    0.7.0.1
 */