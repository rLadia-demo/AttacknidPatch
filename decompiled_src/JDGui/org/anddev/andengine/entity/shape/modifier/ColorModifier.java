package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ColorModifier
  extends TripleValueSpanShapeModifier
{
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, null, IEaseFunction.DEFAULT);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIShapeModifierListener, IEaseFunction.DEFAULT);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, null, paramIEaseFunction);
  }
  
  protected ColorModifier(ColorModifier paramColorModifier)
  {
    super(paramColorModifier);
  }
  
  public ColorModifier clone()
  {
    return new ColorModifier(this);
  }
  
  protected void onSetInitialValues(IShape paramIShape, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramIShape.setColor(paramFloat1, paramFloat2, paramFloat3);
  }
  
  protected void onSetValues(IShape paramIShape, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    paramIShape.setColor(paramFloat2, paramFloat3, paramFloat4);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.ColorModifier
 * JD-Core Version:    0.7.0.1
 */