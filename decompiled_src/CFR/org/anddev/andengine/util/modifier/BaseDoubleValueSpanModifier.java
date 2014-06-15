/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseSingleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public abstract class BaseDoubleValueSpanModifier<T>
extends BaseSingleValueSpanModifier<T> {
    private final float mFromValueB;
    private final float mValueSpanB;

    public BaseDoubleValueSpanModifier(float f, float f2, float f3, float f4, float f5) {
        this(f, f2, f3, f4, f5, null, IEaseFunction.DEFAULT);
    }

    public BaseDoubleValueSpanModifier(float f, float f2, float f3, float f4, float f5, IModifier.IModifierListener<T> iModifierListener) {
        this(f, f2, f3, f4, f5, iModifierListener, IEaseFunction.DEFAULT);
    }

    public BaseDoubleValueSpanModifier(float f, float f2, float f3, float f4, float f5, IModifier.IModifierListener<T> iModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, iModifierListener, iEaseFunction);
        this.mFromValueB = f4;
        this.mValueSpanB = f5 - f4;
    }

    public BaseDoubleValueSpanModifier(float f, float f2, float f3, float f4, float f5, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, null, iEaseFunction);
    }

    protected BaseDoubleValueSpanModifier(BaseDoubleValueSpanModifier<T> baseDoubleValueSpanModifier) {
        super(baseDoubleValueSpanModifier);
        this.mFromValueB = baseDoubleValueSpanModifier.mFromValueB;
        this.mValueSpanB = baseDoubleValueSpanModifier.mValueSpanB;
    }

    @Override
    protected void onSetInitialValue(T T, float f) {
        this.onSetInitialValues(T, f, this.mFromValueB);
    }

    protected abstract void onSetInitialValues(T var1, float var2, float var3);

    @Override
    protected void onSetValue(T T, float f, float f2) {
        this.onSetValues(T, f, f2, this.mFromValueB + f * this.mValueSpanB);
    }

    protected abstract void onSetValues(T var1, float var2, float var3, float var4);
}

