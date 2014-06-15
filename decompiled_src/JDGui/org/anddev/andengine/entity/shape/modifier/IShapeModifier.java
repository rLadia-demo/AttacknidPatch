package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.IModifier.IModifierListener;

public abstract interface IShapeModifier
  extends IModifier<IShape>
{
  public static abstract interface IShapeModifierListener
    extends IModifier.IModifierListener<IShape>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.IShapeModifier
 * JD-Core Version:    0.7.0.1
 */