package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseDoubleValueSpanModifier<T>
  extends BaseSingleValueSpanModifier<T>
{
  private final float mFromValueB;
  private final float mValueSpanB;
  
  public BaseDoubleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, IEaseFunction.DEFAULT);
  }
  
  public BaseDoubleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IModifier.IModifierListener<T> paramIModifierListener)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIModifierListener, IEaseFunction.DEFAULT);
  }
  
  public BaseDoubleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IModifier.IModifierListener<T> paramIModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramIModifierListener, paramIEaseFunction);
    this.mFromValueB = paramFloat4;
    this.mValueSpanB = (paramFloat5 - paramFloat4);
  }
  
  public BaseDoubleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, null, paramIEaseFunction);
  }
  
  protected BaseDoubleValueSpanModifier(BaseDoubleValueSpanModifier<T> paramBaseDoubleValueSpanModifier)
  {
    super(paramBaseDoubleValueSpanModifier);
    this.mFromValueB = paramBaseDoubleValueSpanModifier.mFromValueB;
    this.mValueSpanB = paramBaseDoubleValueSpanModifier.mValueSpanB;
  }
  
  protected void onSetInitialValue(T paramT, float paramFloat)
  {
    onSetInitialValues(paramT, paramFloat, this.mFromValueB);
  }
  
  protected abstract void onSetInitialValues(T paramT, float paramFloat1, float paramFloat2);
  
  protected void onSetValue(T paramT, float paramFloat1, float paramFloat2)
  {
    onSetValues(paramT, paramFloat1, paramFloat2, this.mFromValueB + paramFloat1 * this.mValueSpanB);
  }
  
  protected abstract void onSetValues(T paramT, float paramFloat1, float paramFloat2, float paramFloat3);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseDoubleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */