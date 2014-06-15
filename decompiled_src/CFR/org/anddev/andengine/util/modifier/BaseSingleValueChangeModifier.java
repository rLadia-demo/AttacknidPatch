/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseDurationModifier;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class BaseSingleValueChangeModifier<T>
extends BaseDurationModifier<T> {
    private final float mValueChangePerSecond;

    public BaseSingleValueChangeModifier(float f, float f2) {
        this(f, f2, null);
    }

    public BaseSingleValueChangeModifier(float f, float f2, IModifier.IModifierListener<T> iModifierListener) {
        super(f, iModifierListener);
        this.mValueChangePerSecond = f2 / f;
    }

    protected BaseSingleValueChangeModifier(BaseSingleValueChangeModifier<T> baseSingleValueChangeModifier) {
        super(baseSingleValueChangeModifier);
        this.mValueChangePerSecond = baseSingleValueChangeModifier.mValueChangePerSecond;
    }

    protected abstract void onChangeValue(T var1, float var2);

    @Override
    protected void onManagedInitialize(T T) {
    }

    @Override
    protected void onManagedUpdate(float f, T T) {
        this.onChangeValue(T, f * this.mValueChangePerSecond);
    }
}

