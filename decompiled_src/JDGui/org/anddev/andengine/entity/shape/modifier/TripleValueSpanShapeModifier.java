package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseTripleValueSpanModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class TripleValueSpanShapeModifier
  extends BaseTripleValueSpanModifier<IShape>
  implements IShapeModifier
{
  public TripleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIShapeModifierListener, paramIEaseFunction);
  }
  
  public TripleValueSpanShapeModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramIEaseFunction);
  }
  
  protected TripleValueSpanShapeModifier(TripleValueSpanShapeModifier paramTripleValueSpanShapeModifier)
  {
    super(paramTripleValueSpanShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.TripleValueSpanShapeModifier
 * JD-Core Version:    0.7.0.1
 */