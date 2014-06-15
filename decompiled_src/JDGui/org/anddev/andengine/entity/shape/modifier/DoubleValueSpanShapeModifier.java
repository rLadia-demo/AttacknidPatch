package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseDoubleValueSpanModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class DoubleValueSpanShapeModifier
  extends BaseDoubleValueSpanModifier<IShape>
  implements IShapeModifier
{
  public DoubleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5);
  }
  
  public DoubleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener);
  }
  
  public DoubleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public DoubleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIEaseFunction);
  }
  
  protected DoubleValueSpanShapeModifier(DoubleValueSpanShapeModifier paramDoubleValueSpanShapeModifier)
  {
    super(paramDoubleValueSpanShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.DoubleValueSpanShapeModifier
 * JD-Core Version:    0.7.0.1
 */