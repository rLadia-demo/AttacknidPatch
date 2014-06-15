package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.ParallelModifier;

public class ParallelShapeModifier
  extends ParallelModifier<IShape>
  implements IShapeModifier
{
  public ParallelShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IShapeModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIShapeModifierListener, paramVarArgs);
  }
  
  protected ParallelShapeModifier(ParallelShapeModifier paramParallelShapeModifier)
  {
    super(paramParallelShapeModifier);
  }
  
  public ParallelShapeModifier(IShapeModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramVarArgs);
  }
  
  public ParallelShapeModifier clone()
  {
    return new ParallelShapeModifier(this);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.ParallelShapeModifier
 * JD-Core Version:    0.7.0.1
 */