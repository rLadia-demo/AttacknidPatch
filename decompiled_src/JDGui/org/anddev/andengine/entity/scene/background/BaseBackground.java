package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ModifierList;

public abstract class BaseBackground
  implements IBackground
{
  private final ModifierList<IBackground> mBackgroundModifiers = new ModifierList(this);
  
  public void addBackgroundModifier(IModifier<IBackground> paramIModifier)
  {
    this.mBackgroundModifiers.add(paramIModifier);
  }
  
  public void clearBackgroundModifiers()
  {
    this.mBackgroundModifiers.clear();
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mBackgroundModifiers.onUpdate(paramFloat);
  }
  
  public boolean removeBackgroundModifier(IModifier<IBackground> paramIModifier)
  {
    return this.mBackgroundModifiers.remove(paramIModifier);
  }
  
  public void reset()
  {
    this.mBackgroundModifiers.reset();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.BaseBackground
 * JD-Core Version:    0.7.0.1
 */