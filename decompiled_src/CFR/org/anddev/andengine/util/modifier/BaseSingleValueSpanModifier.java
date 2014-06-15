/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseDurationModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseSingleValueSpanModifier<T>
extends BaseDurationModifier<T> {
    protected final IEaseFunction mEaseFunction;
    private final float mFromValue;
    private final float mValueSpan;

    public BaseSingleValueSpanModifier(float f, float f2, float f3) {
        this(f, f2, f3, null, IEaseFunction.DEFAULT);
    }

    public BaseSingleValueSpanModifier(float f, float f2, float f3, IModifier.IModifierListener<T> iModifierListener) {
        this(f, f2, f3, IEaseFunction.DEFAULT);
    }

    public BaseSingleValueSpanModifier(float f, float f2, float f3, IModifier.IModifierListener<T> iModifierListener, IEaseFunction iEaseFunction) {
        super(f, iModifierListener);
        this.mFromValue = f2;
        this.mValueSpan = f3 - f2;
        this.mEaseFunction = iEaseFunction;
    }

    public BaseSingleValueSpanModifier(float f, float f2, float f3, IEaseFunction iEaseFunction) {
        this(f, f2, f3, null, iEaseFunction);
    }

    protected BaseSingleValueSpanModifier(BaseSingleValueSpanModifier<T> baseSingleValueSpanModifier) {
        super(baseSingleValueSpanModifier);
        this.mFromValue = baseSingleValueSpanModifier.mFromValue;
        this.mValueSpan = baseSingleValueSpanModifier.mValueSpan;
        this.mEaseFunction = baseSingleValueSpanModifier.mEaseFunction;
    }

    @Override
    protected void onManagedInitialize(T T) {
        this.onSetInitialValue(T, this.mFromValue);
    }

    @Override
    protected void onManagedUpdate(float f, T T) {
        float f2 = this.mEaseFunction.getPercentageDone(this.getTotalSecondsElapsed(), this.mDuration, 0.0f, 1.0f);
        this.onSetValue(T, f2, this.mFromValue + f2 * this.mValueSpan);
    }

    protected abstract void onSetInitialValue(T var1, float var2);

    protected abstract void onSetValue(T var1, float var2, float var3);
}

