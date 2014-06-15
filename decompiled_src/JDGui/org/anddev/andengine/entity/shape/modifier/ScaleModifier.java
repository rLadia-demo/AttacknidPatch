package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ScaleModifier
  extends DoubleValueSpanShapeModifier
{
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, IEaseFunction.DEFAULT);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, paramIEaseFunction);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat2, paramFloat3, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat2, paramFloat3, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected ScaleModifier(ScaleModifier paramScaleModifier)
  {
    super(paramScaleModifier);
  }
  
  public ScaleModifier clone()
  {
    return new ScaleModifier(this);
  }
  
  protected void onSetInitialValues(IShape paramIShape, float paramFloat1, float paramFloat2)
  {
    paramIShape.setScale(paramFloat1, paramFloat2);
  }
  
  protected void onSetValues(IShape paramIShape, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramIShape.setScale(paramFloat2, paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.ScaleModifier
 * JD-Core Version:    0.7.0.1
 */