package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.IModifier.IModifierListener;

public abstract interface IBackgroundModifier
  extends IModifier<IBackground>
{
  public static abstract interface IBackgroundModifierListener
    extends IModifier.IModifierListener<IBackground>
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.background.modifier.IBackgroundModifier
 * JD-Core Version:    0.7.0.1
 */