package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseDurationModifier;

public abstract class DurationShapeModifier
  extends BaseDurationModifier<IShape>
  implements IShapeModifier
{
  public DurationShapeModifier() {}
  
  public DurationShapeModifier(float paramFloat)
  {
    super(paramFloat);
  }
  
  public DurationShapeModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat, paramIShapeModifierListener);
  }
  
  protected DurationShapeModifier(DurationShapeModifier paramDurationShapeModifier)
  {
    super(paramDurationShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.DurationShapeModifier
 * JD-Core Version:    0.7.0.1
 */