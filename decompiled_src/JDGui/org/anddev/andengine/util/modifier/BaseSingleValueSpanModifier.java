package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseSingleValueSpanModifier<T>
  extends BaseDurationModifier<T>
{
  protected final IEaseFunction mEaseFunction;
  private final float mFromValue;
  private final float mValueSpan;
  
  public BaseSingleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, IEaseFunction.DEFAULT);
  }
  
  public BaseSingleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, IModifier.IModifierListener<T> paramIModifierListener)
  {
    this(paramFloat1, paramFloat2, paramFloat3, IEaseFunction.DEFAULT);
  }
  
  public BaseSingleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, IModifier.IModifierListener<T> paramIModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramIModifierListener);
    this.mFromValue = paramFloat2;
    this.mValueSpan = (paramFloat3 - paramFloat2);
    this.mEaseFunction = paramIEaseFunction;
  }
  
  public BaseSingleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, null, paramIEaseFunction);
  }
  
  protected BaseSingleValueSpanModifier(BaseSingleValueSpanModifier<T> paramBaseSingleValueSpanModifier)
  {
    super(paramBaseSingleValueSpanModifier);
    this.mFromValue = paramBaseSingleValueSpanModifier.mFromValue;
    this.mValueSpan = paramBaseSingleValueSpanModifier.mValueSpan;
    this.mEaseFunction = paramBaseSingleValueSpanModifier.mEaseFunction;
  }
  
  protected void onManagedInitialize(T paramT)
  {
    onSetInitialValue(paramT, this.mFromValue);
  }
  
  protected void onManagedUpdate(float paramFloat, T paramT)
  {
    float f = this.mEaseFunction.getPercentageDone(getTotalSecondsElapsed(), this.mDuration, 0.0F, 1.0F);
    onSetValue(paramT, f, this.mFromValue + f * this.mValueSpan);
  }
  
  protected abstract void onSetInitialValue(T paramT, float paramFloat);
  
  protected abstract void onSetValue(T paramT, float paramFloat1, float paramFloat2);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseSingleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */