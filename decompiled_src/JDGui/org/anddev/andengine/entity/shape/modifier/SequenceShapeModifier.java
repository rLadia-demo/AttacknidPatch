package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.modifier.SequenceModifier;
import org.anddev.andengine.util.modifier.SequenceModifier.ISubSequenceModifierListener;

public class SequenceShapeModifier
  extends SequenceModifier<IShape>
  implements IShapeModifier
{
  public SequenceShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener, ISubSequenceShapeModifierListener paramISubSequenceShapeModifierListener, IShapeModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIShapeModifierListener, paramISubSequenceShapeModifierListener, paramVarArgs);
  }
  
  public SequenceShapeModifier(IShapeModifier.IShapeModifierListener paramIShapeModifierListener, IShapeModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIShapeModifierListener, paramVarArgs);
  }
  
  protected SequenceShapeModifier(SequenceShapeModifier paramSequenceShapeModifier)
  {
    super(paramSequenceShapeModifier);
  }
  
  public SequenceShapeModifier(IShapeModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramVarArgs);
  }
  
  public SequenceShapeModifier clone()
  {
    return new SequenceShapeModifier(this);
  }
  
  public static abstract interface ISubSequenceShapeModifierListener
    extends SequenceModifier.ISubSequenceModifierListener<IShape>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.modifier.SequenceShapeModifier
 * JD-Core Version:    0.7.0.1
 */