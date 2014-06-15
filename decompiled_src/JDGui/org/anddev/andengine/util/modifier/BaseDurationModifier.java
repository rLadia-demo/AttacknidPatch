package org.anddev.andengine.util.modifier;

public abstract class BaseDurationModifier<T>
  extends BaseModifier<T>
{
  protected final float mDuration;
  private float mTotalSecondsElapsed;
  
  public BaseDurationModifier()
  {
    this(-1.0F, null);
  }
  
  public BaseDurationModifier(float paramFloat)
  {
    this(paramFloat, null);
  }
  
  public BaseDurationModifier(float paramFloat, IModifier.IModifierListener<T> paramIModifierListener)
  {
    super(paramIModifierListener);
    this.mDuration = paramFloat;
  }
  
  protected BaseDurationModifier(BaseDurationModifier<T> paramBaseDurationModifier)
  {
    this(paramBaseDurationModifier.mDuration, paramBaseDurationModifier.mModifierListener);
  }
  
  public float getDuration()
  {
    return this.mDuration;
  }
  
  protected float getTotalSecondsElapsed()
  {
    return this.mTotalSecondsElapsed;
  }
  
  protected abstract void onManagedInitialize(T paramT);
  
  protected abstract void onManagedUpdate(float paramFloat, T paramT);
  
  public final void onUpdate(float paramFloat, T paramT)
  {
    if (!this.mFinished)
    {
      if (this.mTotalSecondsElapsed == 0.0F) {
        onManagedInitialize(paramT);
      }
      if (paramFloat + this.mTotalSecondsElapsed >= this.mDuration) {
        break label107;
      }
    }
    label107:
    for (float f = paramFloat;; f = this.mDuration - this.mTotalSecondsElapsed)
    {
      this.mTotalSecondsElapsed = (f + this.mTotalSecondsElapsed);
      onManagedUpdate(f, paramT);
      if ((this.mDuration != -1.0F) && (this.mTotalSecondsElapsed >= this.mDuration))
      {
        this.mTotalSecondsElapsed = this.mDuration;
        this.mFinished = true;
        if (this.mModifierListener != null) {
          this.mModifierListener.onModifierFinished(this, paramT);
        }
      }
      return;
    }
  }
  
  public void reset()
  {
    this.mFinished = false;
    this.mTotalSecondsElapsed = 0.0F;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseDurationModifier
 * JD-Core Version:    0.7.0.1
 */