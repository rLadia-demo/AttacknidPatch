package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveModifier
  extends DoubleValueSpanShapeModifier
{
  public MoveModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, IEaseFunction.DEFAULT);
  }
  
  public MoveModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public MoveModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public MoveModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, paramIEaseFunction);
  }
  
  protected MoveModifier(MoveModifier paramMoveModifier)
  {
    super(paramMoveModifier);
  }
  
  public MoveModifier clone()
  {
    return new MoveModifier(this);
  }
  
  protected void onSetInitialValues(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setPosition(paramFloat1, paramFloat2);
  }
  
  protected void onSetValues(IShape paramIShape, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramIShape.setPosition(paramFloat2, paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.MoveModifier
 * JD-Core Version:    0.7.0.1
 */