package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.LoopModifier;
import org.anddev.andengine.util.modifier.LoopModifier.ILoopModifierListener;

public class LoopShapeModifier
  extends LoopModifier<IShape>
  implements IShapeModifier
{
  public LoopShapeModifier(int paramInt, IShapeModifier paramIShapeModifier)
  {
    super(paramInt, paramIShapeModifier);
  }
  
  public LoopShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener, int paramInt, IShapeModifier paramIShapeModifier)
  {
    super(paramIShapeModifierListener, paramInt, paramIShapeModifier);
  }
  
  public LoopShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener, int paramInt, ILoopShapeModifierListener paramILoopShapeModifierListener, IShapeModifier paramIShapeModifier)
  {
    super(paramIShapeModifierListener, paramInt, paramILoopShapeModifierListener, paramIShapeModifier);
  }
  
  public LoopShapeModifier(IShapeModifier paramIShapeModifier)
  {
    super(paramIShapeModifier);
  }
  
  protected LoopShapeModifier(LoopShapeModifier paramLoopShapeModifier)
  {
    super(paramLoopShapeModifier);
  }
  
  public LoopShapeModifier clone()
  {
    return new LoopShapeModifier(this);
  }
  
  public static abstract interface ILoopShapeModifierListener
    extends LoopModifier.ILoopModifierListener<IShape>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.LoopShapeModifier
 * JD-Core Version:    0.7.0.1
 */