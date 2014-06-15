package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseSingleValueSpanModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class SingleValueSpanShapeModifier
  extends BaseSingleValueSpanModifier<IShape>
  implements IShapeModifier
{
  public SingleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    super(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public SingleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener);
  }
  
  public SingleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public SingleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIEaseFunction);
  }
  
  protected SingleValueSpanShapeModifier(SingleValueSpanShapeModifier paramSingleValueSpanShapeModifier)
  {
    super(paramSingleValueSpanShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.SingleValueSpanShapeModifier
 * JD-Core Version:    0.7.0.1
 */