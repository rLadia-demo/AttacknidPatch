package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.ParallelModifier;

public class ParallelBackgroundModifier
  extends ParallelModifier<IBackground>
  implements IBackgroundModifier
{
  public ParallelBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, IBackgroundModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramIBackgroundModifierListener, paramVarArgs);
  }
  
  protected ParallelBackgroundModifier(ParallelBackgroundModifier paramParallelBackgroundModifier)
  {
    super(paramParallelBackgroundModifier);
  }
  
  public ParallelBackgroundModifier(IBackgroundModifier... paramVarArgs)
    throws IllegalArgumentException
  {
    super(paramVarArgs);
  }
  
  public ParallelBackgroundModifier clone()
  {
    return new ParallelBackgroundModifier(this);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.modifier.ParallelBackgroundModifier
 * JD-Core Version:    0.7.0.1
 */