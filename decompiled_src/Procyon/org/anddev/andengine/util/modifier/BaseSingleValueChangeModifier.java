package org.anddev.andengine.util.modifier;

public abstract class BaseSingleValueChangeModifier<T> extends BaseDurationModifier<T>
{
    private final float mValueChangePerSecond;
    
    public BaseSingleValueChangeModifier(final float n, final float n2) {
        this(n, n2, null);
    }
    
    public BaseSingleValueChangeModifier(final float n, final float n2, final IModifierListener<T> modifierListener) {
        super(n, modifierListener);
        this.mValueChangePerSecond = n2 / n;
    }
    
    protected BaseSingleValueChangeModifier(final BaseSingleValueChangeModifier<T> baseSingleValueChangeModifier) {
        super(baseSingleValueChangeModifier);
        this.mValueChangePerSecond = baseSingleValueChangeModifier.mValueChangePerSecond;
    }
    
    protected abstract void onChangeValue(final T p0, final float p1);
    
    @Override
    protected void onManagedInitialize(final T t) {
    }
    
    @Override
    protected void onManagedUpdate(final float n, final T t) {
        this.onChangeValue(t, n * this.mValueChangePerSecond);
    }
}
