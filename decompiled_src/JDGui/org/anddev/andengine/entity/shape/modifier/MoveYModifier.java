package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class MoveYModifier
  extends SingleValueSpanShapeModifier
{
  public MoveYModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public MoveYModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public MoveYModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public MoveYModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected MoveYModifier(MoveYModifier paramMoveYModifier)
  {
    super(paramMoveYModifier);
  }
  
  public MoveYModifier clone()
  {
    return new MoveYModifier(this);
  }
  
  protected void onSetInitialValue(IShape paramIShape, float paramFloat)
  {
    paramIShape.setPosition(paramIShape.getX(), paramFloat);
  }
  
  protected void onSetValue(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setPosition(paramIShape.getX(), paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.MoveYModifier
 * JD-Core Version:    0.7.0.1
 */