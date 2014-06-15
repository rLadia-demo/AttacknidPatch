package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseTripleValueSpanModifier<T>
  extends BaseDoubleValueSpanModifier<T>
{
  private final float mFromValueC;
  private final float mValueSpanC;
  
  public BaseTripleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IModifier.IModifierListener<T> paramIModifierListener, IEaseFunction paramIEaseFunction)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramIModifierListener, paramIEaseFunction);
    this.mFromValueC = paramFloat6;
    this.mValueSpanC = (paramFloat7 - paramFloat6);
  }
  
  public BaseTripleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, IEaseFunction paramIEaseFunction)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, null, paramIEaseFunction);
  }
  
  protected BaseTripleValueSpanModifier(BaseTripleValueSpanModifier<T> paramBaseTripleValueSpanModifier)
  {
    super(paramBaseTripleValueSpanModifier);
    this.mFromValueC = paramBaseTripleValueSpanModifier.mFromValueC;
    this.mValueSpanC = paramBaseTripleValueSpanModifier.mValueSpanC;
  }
  
  protected void onSetInitialValues(T paramT, float paramFloat1, float paramFloat2)
  {
    onSetInitialValues(paramT, paramFloat1, paramFloat2, this.mFromValueC);
  }
  
  protected abstract void onSetInitialValues(T paramT, float paramFloat1, float paramFloat2, float paramFloat3);
  
  protected void onSetValues(T paramT, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    onSetValues(paramT, paramFloat1, paramFloat2, paramFloat3, this.mFromValueC + paramFloat1 * this.mValueSpanC);
  }
  
  protected abstract void onSetValues(T paramT, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseTripleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */