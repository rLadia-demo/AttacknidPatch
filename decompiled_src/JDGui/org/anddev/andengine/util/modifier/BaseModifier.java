package org.anddev.andengine.util.modifier;

public abstract class BaseModifier<T>
  implements IModifier<T>
{
  protected boolean mFinished;
  protected IModifier.IModifierListener<T> mModifierListener;
  private boolean mRemoveWhenFinished = true;
  
  public BaseModifier()
  {
    this(null);
  }
  
  protected BaseModifier(BaseModifier<T> paramBaseModifier)
  {
    this(paramBaseModifier.mModifierListener);
  }
  
  public BaseModifier(IModifier.IModifierListener<T> paramIModifierListener)
  {
    this.mModifierListener = paramIModifierListener;
  }
  
  public abstract IModifier<T> clone();
  
  public IModifier.IModifierListener<T> getModifierListener()
  {
    return this.mModifierListener;
  }
  
  public boolean isFinished()
  {
    return this.mFinished;
  }
  
  public final boolean isRemoveWhenFinished()
  {
    return this.mRemoveWhenFinished;
  }
  
  public void setModifierListener(IModifier.IModifierListener<T> paramIModifierListener)
  {
    this.mModifierListener = paramIModifierListener;
  }
  
  public final void setRemoveWhenFinished(boolean paramBoolean)
  {
    this.mRemoveWhenFinished = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseModifier
 * JD-Core Version:    0.7.0.1
 */