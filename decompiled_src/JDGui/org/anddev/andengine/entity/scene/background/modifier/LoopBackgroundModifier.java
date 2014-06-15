package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.LoopModifier;
import org.anddev.andengine.util.modifier.LoopModifier.ILoopModifierListener;

public class LoopBackgroundModifier
  extends LoopModifier<IBackground>
  implements IBackgroundModifier
{
  public LoopBackgroundModifier(int paramInt, IBackgroundModifier paramIBackgroundModifier)
  {
    super(paramInt, paramIBackgroundModifier);
  }
  
  public LoopBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, int paramInt, IBackgroundModifier paramIBackgroundModifier)
  {
    super(paramIBackgroundModifierListener, paramInt, paramIBackgroundModifier);
  }
  
  public LoopBackgroundModifier(IBackgroundModifier.IBackgroundModifierListener paramIBackgroundModifierListener, int paramInt, ILoopBackgroundModifierListener paramILoopBackgroundModifierListener, IBackgroundModifier paramIBackgroundModifier)
  {
    super(paramIBackgroundModifierListener, paramInt, paramILoopBackgroundModifierListener, paramIBackgroundModifier);
  }
  
  public LoopBackgroundModifier(IBackgroundModifier paramIBackgroundModifier)
  {
    super(paramIBackgroundModifier);
  }
  
  protected LoopBackgroundModifier(LoopBackgroundModifier paramLoopBackgroundModifier)
  {
    super(paramLoopBackgroundModifier);
  }
  
  public LoopBackgroundModifier clone()
  {
    return new LoopBackgroundModifier(this);
  }
  
  public static abstract interface ILoopBackgroundModifierListener
    extends LoopModifier.ILoopModifierListener<IBackground>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.modifier.LoopBackgroundModifier
 * JD-Core Version:    0.7.0.1
 */