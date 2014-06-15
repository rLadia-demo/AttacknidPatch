package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.SequenceModifier;
import org.anddev.andengine.util.modifier.SequenceModifier.ISubSequenceModifierListener;

public class SequenceBackgroundModifier
  extends SequenceModifier<IBackground>
  implements IBackgroundModifier
{
  public SequenceBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, ISubSequenceBackgroundModifierListener paramISubSequenceBackgroundModifierListener, IBackgroundModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIBackgroundModifierListener, paramISubSequenceBackgroundModifierListener, paramVarArgs);
  }
  
  public SequenceBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, IBackgroundModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIBackgroundModifierListener, paramVarArgs);
  }
  
  protected SequenceBackgroundModifier(SequenceBackgroundModifier paramSequenceBackgroundModifier)
  {
    super(paramSequenceBackgroundModifier);
  }
  
  public SequenceBackgroundModifier(IBackgroundModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramVarArgs);
  }
  
  public SequenceBackgroundModifier clone()
  {
    return new SequenceBackgroundModifier(this);
  }
  
  public static abstract interface ISubSequenceBackgroundModifierListener
    extends SequenceModifier.ISubSequenceModifierListener<IBackground>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.modifier.SequenceBackgroundModifier
 * JD-Core Version:    0.7.0.1
 */