/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseModifier;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class BaseDurationModifier<T>
extends BaseModifier<T> {
    protected final float mDuration;
    private float mTotalSecondsElapsed;

    public BaseDurationModifier() {
        this(-1.0f, null);
    }

    public BaseDurationModifier(float f) {
        this(f, null);
    }

    public BaseDurationModifier(float f, IModifier.IModifierListener<T> iModifierListener) {
        super(iModifierListener);
        this.mDuration = f;
    }

    protected BaseDurationModifier(BaseDurationModifier<T> baseDurationModifier) {
        this(baseDurationModifier.mDuration, baseDurationModifier.mModifierListener);
    }

    @Override
    public float getDuration() {
        return this.mDuration;
    }

    protected float getTotalSecondsElapsed() {
        return this.mTotalSecondsElapsed;
    }

    protected abstract void onManagedInitialize(T var1);

    protected abstract void onManagedUpdate(float var1, T var2);

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public final void onUpdate(float f, T T) {
        if (this.mFinished) return;
        if (this.mTotalSecondsElapsed == 0.0f) {
            this.onManagedInitialize(T);
        }
        float f2 = f + this.mTotalSecondsElapsed < this.mDuration ? f : this.mDuration - this.mTotalSecondsElapsed;
        this.mTotalSecondsElapsed = f2 + this.mTotalSecondsElapsed;
        this.onManagedUpdate(f2, T);
        if (this.mDuration == -1.0f) return;
        if (this.mTotalSecondsElapsed < this.mDuration) return;
        this.mTotalSecondsElapsed = this.mDuration;
        this.mFinished = true;
        if (this.mModifierListener == null) return;
        this.mModifierListener.onModifierFinished(this, T);
    }

    @Override
    public void reset() {
        this.mFinished = false;
        this.mTotalSecondsElapsed = 0.0f;
    }
}

