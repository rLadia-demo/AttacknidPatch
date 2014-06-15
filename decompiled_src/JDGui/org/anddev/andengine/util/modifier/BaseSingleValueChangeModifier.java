package org.anddev.andengine.util.modifier;

public abstract class BaseSingleValueChangeModifier<T>
  extends BaseDurationModifier<T>
{
  private final float mValueChangePerSecond;
  
  public BaseSingleValueChangeModifier(float paramFloat1, float paramFloat2)
  {
    this(paramFloat1, paramFloat2, null);
  }
  
  public BaseSingleValueChangeModifier(float paramFloat1, float paramFloat2, IModifier.IModifierListener<T> paramIModifierListener)
  {
    super(paramFloat1, paramIModifierListener);
    this.mValueChangePerSecond = (paramFloat2 / paramFloat1);
  }
  
  protected BaseSingleValueChangeModifier(BaseSingleValueChangeModifier<T> paramBaseSingleValueChangeModifier)
  {
    super(paramBaseSingleValueChangeModifier);
    this.mValueChangePerSecond = paramBaseSingleValueChangeModifier.mValueChangePerSecond;
  }
  
  protected abstract void onChangeValue(T paramT, float paramFloat);
  
  protected void onManagedInitialize(T paramT) {}
  
  protected void onManagedUpdate(float paramFloat, T paramT)
  {
    onChangeValue(paramT, paramFloat * this.mValueChangePerSecond);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.BaseSingleValueChangeModifier
 * JD-Core Version:    0.7.0.1
 */