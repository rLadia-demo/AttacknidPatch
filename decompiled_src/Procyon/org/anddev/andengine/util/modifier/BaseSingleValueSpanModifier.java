package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.*;

public abstract class BaseSingleValueSpanModifier<T> extends BaseDurationModifier<T>
{
    protected final IEaseFunction mEaseFunction;
    private final float mFromValue;
    private final float mValueSpan;
    
    public BaseSingleValueSpanModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public BaseSingleValueSpanModifier(final float n, final float n2, final float n3, final IModifierListener<T> modifierListener) {
        this(n, n2, n3, IEaseFunction.DEFAULT);
    }
    
    public BaseSingleValueSpanModifier(final float n, final float mFromValue, final float n2, final IModifierListener<T> modifierListener, final IEaseFunction mEaseFunction) {
        super(n, modifierListener);
        this.mFromValue = mFromValue;
        this.mValueSpan = n2 - mFromValue;
        this.mEaseFunction = mEaseFunction;
    }
    
    public BaseSingleValueSpanModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected BaseSingleValueSpanModifier(final BaseSingleValueSpanModifier<T> baseSingleValueSpanModifier) {
        super(baseSingleValueSpanModifier);
        this.mFromValue = baseSingleValueSpanModifier.mFromValue;
        this.mValueSpan = baseSingleValueSpanModifier.mValueSpan;
        this.mEaseFunction = baseSingleValueSpanModifier.mEaseFunction;
    }
    
    @Override
    protected void onManagedInitialize(final T t) {
        this.onSetInitialValue(t, this.mFromValue);
    }
    
    @Override
    protected void onManagedUpdate(final float n, final T t) {
        final float percentageDone = this.mEaseFunction.getPercentageDone(this.getTotalSecondsElapsed(), this.mDuration, 0.0f, 1.0f);
        this.onSetValue(t, percentageDone, this.mFromValue + percentageDone * this.mValueSpan);
    }
    
    protected abstract void onSetInitialValue(final T p0, final float p1);
    
    protected abstract void onSetValue(final T p0, final float p1, final float p2);
}
