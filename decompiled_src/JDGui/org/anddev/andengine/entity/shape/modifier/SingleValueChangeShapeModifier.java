package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseSingleValueChangeModifier;

public abstract class SingleValueChangeShapeModifier
  extends BaseSingleValueChangeModifier<IShape>
  implements IShapeModifier
{
  public SingleValueChangeShapeModifier(float paramFloat1, float paramFloat2)
  {
    super(paramFloat1, paramFloat2);
  }
  
  public SingleValueChangeShapeModifier(float paramFloat1, float paramFloat2, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramIShapeModifierListener);
  }
  
  protected SingleValueChangeShapeModifier(SingleValueChangeShapeModifier paramSingleValueChangeShapeModifier)
  {
    super(paramSingleValueChangeShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.SingleValueChangeShapeModifier
 * JD-Core Version:    0.7.0.1
 */