package org.anddev.andengine.util.modifier;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;

public class ModifierList<T>
  extends ArrayList<IModifier<T>>
  implements IUpdateHandler
{
  private static final long serialVersionUID = 1610345592534873475L;
  private final T mTarget;
  
  public ModifierList(T paramT)
  {
    this.mTarget = paramT;
  }
  
  public T getTarget()
  {
    return this.mTarget;
  }
  
  public void onUpdate(float paramFloat)
  {
    int i = size();
    if (i > 0) {}
    for (int j = i - 1;; j--)
    {
      if (j < 0) {
        return;
      }
      IModifier localIModifier = (IModifier)get(j);
      localIModifier.onUpdate(paramFloat, this.mTarget);
      if ((localIModifier.isFinished()) && (localIModifier.isRemoveWhenFinished())) {
        remove(j);
      }
    }
  }
  
  public void reset()
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((IModifier)get(i)).reset();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ModifierList
 * JD-Core Version:    0.7.0.1
 */