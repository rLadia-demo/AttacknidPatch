package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveXModifier
  extends SingleValueSpanShapeModifier
{
  public MoveXModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public MoveXModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public MoveXModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public MoveXModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected MoveXModifier(MoveXModifier paramMoveXModifier)
  {
    super(paramMoveXModifier);
  }
  
  public MoveXModifier clone()
  {
    return new MoveXModifier(this);
  }
  
  protected void onSetInitialValue(IShape paramIShape, float paramFloat)
  {
    paramIShape.setPosition(paramFloat, paramIShape.getY());
  }
  
  protected void onSetValue(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setPosition(paramFloat2, paramIShape.getY());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.MoveXModifier
 * JD-Core Version:    0.7.0.1
 */