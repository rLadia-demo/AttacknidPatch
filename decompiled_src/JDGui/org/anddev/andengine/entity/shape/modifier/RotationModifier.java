package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class RotationModifier
  extends SingleValueSpanShapeModifier
{
  public RotationModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public RotationModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public RotationModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public RotationModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected RotationModifier(RotationModifier paramRotationModifier)
  {
    super(paramRotationModifier);
  }
  
  public RotationModifier clone()
  {
    return new RotationModifier(this);
  }
  
  protected void onSetInitialValue(IShape paramIShape, float paramFloat)
  {
    paramIShape.setRotation(paramFloat);
  }
  
  protected void onSetValue(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setRotation(paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.RotationModifier
 * JD-Core Version:    0.7.0.1
 */