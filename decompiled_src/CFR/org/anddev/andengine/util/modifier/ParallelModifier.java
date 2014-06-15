/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.util.ModifierUtils;

public class ParallelModifier<T>
extends BaseModifier<T> {
    private final float mDuration;
    private boolean mFinishedCached;
    private final IModifier<T>[] mModifiers;

    public /* varargs */ ParallelModifier(IModifier.IModifierListener<T> iModifierListener, IModifier<T> ... arriModifier) throws IllegalArgumentException {
        super(iModifierListener);
        if (arriModifier.length == 0) {
            throw new IllegalArgumentException("pModifiers must not be empty!");
        }
        this.mModifiers = arriModifier;
        IModifier<T> iModifier = ModifierUtils.getModifierWithLongestDuration(arriModifier);
        this.mDuration = iModifier.getDuration();
        iModifier.setModifierListener(new InternalModifierListener(null));
    }

    protected ParallelModifier(ParallelModifier<T> parallelModifier) {
        super(parallelModifier.mModifierListener);
        IModifier<T>[] arriModifier = parallelModifier.mModifiers;
        IModifier<T>[] arriModifier2 = this.mModifiers = new IModifier[arriModifier.length];
        int n = -1 + arriModifier2.length;
        do {
            if (n < 0) {
                IModifier<T> iModifier = ModifierUtils.getModifierWithLongestDuration(arriModifier2);
                this.mDuration = iModifier.getDuration();
                iModifier.setModifierListener(new InternalModifierListener(null));
                return;
            }
            arriModifier2[n] = arriModifier[n].clone();
            --n;
        } while (true);
    }

    public /* varargs */ ParallelModifier(IModifier<T> ... arriModifier) throws IllegalArgumentException {
        this((IModifier.IModifierListener<T>)null, arriModifier);
    }

    static /* synthetic */ void access$1(ParallelModifier parallelModifier, boolean bl) {
        parallelModifier.mFinishedCached = bl;
    }

    @Override
    public ParallelModifier<T> clone() {
        return new ParallelModifier<T>(this);
    }

    @Override
    public float getDuration() {
        return this.mDuration;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void onUpdate(float f, T T) {
        this.mFinishedCached = false;
        IModifier<T>[] arriModifier = this.mModifiers;
        for (int i = -1 + arriModifier.length; i >= 0; --i) {
            arriModifier[i].onUpdate(f, T);
            if (this.mFinishedCached) return;
        }
        this.mFinishedCached = false;
    }

    @Override
    public void reset() {
        this.mFinished = false;
        IModifier<T>[] arriModifier = this.mModifiers;
        int n = -1 + arriModifier.length;
        while (n >= 0) {
            arriModifier[n].reset();
            --n;
        }
        return;
    }

    class InternalModifierListener
    implements IModifier.IModifierListener<T> {
        private InternalModifierListener() {
        }

        /* synthetic */ InternalModifierListener(ParallelModifier parallelModifier, InternalModifierListener internalModifierListener) {
            this();
        }

        @Override
        public void onModifierFinished(IModifier<T> iModifier, T T) {
            this$0.mFinished = true;
            ParallelModifier.access$1(this$0, true);
            if (this$0.mModifierListener == null) return;
            this$0.mModifierListener.onModifierFinished(this$0, T);
        }
    }

}

