package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;

public class DelayModifier
  extends DurationShapeModifier
{
  public DelayModifier(float paramFloat)
  {
    super(paramFloat);
  }
  
  public DelayModifier(float paramFloat, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat, paramIShapeModifierListener);
  }
  
  protected DelayModifier(DelayModifier paramDelayModifier)
  {
    super(paramDelayModifier);
  }
  
  public DelayModifier clone()
  {
    return new DelayModifier(this);
  }
  
  protected void onManagedInitialize(IShape paramIShape) {}
  
  protected void onManagedUpdate(float paramFloat, IShape paramIShape) {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.DelayModifier
 * JD-Core Version:    0.7.0.1
 */