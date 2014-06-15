package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.BaseModifier;

public abstract class ShapeModifier
  extends BaseModifier<IShape>
  implements IShapeModifier
{
  public ShapeModifier() {}
  
  public ShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener)
  {
    super(paramIShapeModifierListener);
  }
  
  protected ShapeModifier(ShapeModifier paramShapeModifier)
  {
    super(paramShapeModifier);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.ShapeModifier
 * JD-Core Version:    0.7.0.1
 */