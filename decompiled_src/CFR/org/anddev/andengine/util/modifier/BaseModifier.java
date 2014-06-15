/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.IModifier;

public abstract class BaseModifier<T>
implements IModifier<T> {
    protected boolean mFinished;
    protected IModifier.IModifierListener<T> mModifierListener;
    private boolean mRemoveWhenFinished = true;

    public BaseModifier() {
        this((IModifier.IModifierListener<T>)null);
    }

    protected BaseModifier(BaseModifier<T> baseModifier) {
        this(baseModifier.mModifierListener);
    }

    public BaseModifier(IModifier.IModifierListener<T> iModifierListener) {
        this.mModifierListener = iModifierListener;
    }

    @Override
    public abstract IModifier<T> clone();

    @Override
    public IModifier.IModifierListener<T> getModifierListener() {
        return this.mModifierListener;
    }

    @Override
    public boolean isFinished() {
        return this.mFinished;
    }

    @Override
    public final boolean isRemoveWhenFinished() {
        return this.mRemoveWhenFinished;
    }

    @Override
    public void setModifierListener(IModifier.IModifierListener<T> iModifierListener) {
        this.mModifierListener = iModifierListener;
    }

    @Override
    public final void setRemoveWhenFinished(boolean bl) {
        this.mRemoveWhenFinished = bl;
    }
}

