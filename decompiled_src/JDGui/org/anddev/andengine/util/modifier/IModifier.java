package org.anddev.andengine.util.modifier;

public abstract interface IModifier<T>
  extends Cloneable
{
  public abstract IModifier<T> clone();
  
  public abstract float getDuration();
  
  public abstract IModifierListener<T> getModifierListener();
  
  public abstract boolean isFinished();
  
  public abstract boolean isRemoveWhenFinished();
  
  public abstract void onUpdate(float paramFloat, T paramT);
  
  public abstract void reset();
  
  public abstract void setModifierListener(IModifierListener<T> paramIModifierListener);
  
  public abstract void setRemoveWhenFinished(boolean paramBoolean);
  
  public static abstract interface IModifierListener<T>
  {
    public abstract void onModifierFinished(IModifier<T> paramIModifier, T paramT);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.IModifier
 * JD-Core Version:    0.7.0.1
 */