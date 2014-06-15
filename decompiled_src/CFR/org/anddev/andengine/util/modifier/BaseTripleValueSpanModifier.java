/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseDoubleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseTripleValueSpanModifier<T>
extends BaseDoubleValueSpanModifier<T> {
    private final float mFromValueC;
    private final float mValueSpanC;

    public BaseTripleValueSpanModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IModifier.IModifierListener<T> iModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, iModifierListener, iEaseFunction);
        this.mFromValueC = f6;
        this.mValueSpanC = f7 - f6;
    }

    public BaseTripleValueSpanModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, f6, f7, null, iEaseFunction);
    }

    protected BaseTripleValueSpanModifier(BaseTripleValueSpanModifier<T> baseTripleValueSpanModifier) {
        super(baseTripleValueSpanModifier);
        this.mFromValueC = baseTripleValueSpanModifier.mFromValueC;
        this.mValueSpanC = baseTripleValueSpanModifier.mValueSpanC;
    }

    @Override
    protected void onSetInitialValues(T T, float f, float f2) {
        this.onSetInitialValues(T, f, f2, this.mFromValueC);
    }

    protected abstract void onSetInitialValues(T var1, float var2, float var3, float var4);

    @Override
    protected void onSetValues(T T, float f, float f2, float f3) {
        this.onSetValues(T, f, f2, f3, this.mFromValueC + f * this.mValueSpanC);
    }

    protected abstract void onSetValues(T var1, float var2, float var3, float var4, float var5);
}

