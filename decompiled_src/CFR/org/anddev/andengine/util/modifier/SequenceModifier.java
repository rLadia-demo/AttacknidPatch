/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.util.ModifierUtils;

public class SequenceModifier<T>
extends BaseModifier<T> {
    private int mCurrentSubSequenceModifier;
    private final float mDuration;
    private ISubSequenceModifierListener<T> mSubSequenceModifierListener;
    private final IModifier<T>[] mSubSequenceModifiers;

    public /* varargs */ SequenceModifier(IModifier.IModifierListener<T> iModifierListener, ISubSequenceModifierListener<T> iSubSequenceModifierListener, IModifier<T> ... arriModifier) throws IllegalArgumentException {
        super(iModifierListener);
        if (arriModifier.length == 0) {
            throw new IllegalArgumentException("pModifiers must not be empty!");
        }
        this.mSubSequenceModifierListener = iSubSequenceModifierListener;
        this.mSubSequenceModifiers = arriModifier;
        this.mDuration = ModifierUtils.getSequenceDurationOfModifier(arriModifier);
        arriModifier[0].setModifierListener(new InternalModifierListener(null));
    }

    public /* varargs */ SequenceModifier(IModifier.IModifierListener<T> iModifierListener, IModifier<T> ... arriModifier) throws IllegalArgumentException {
        this(iModifierListener, (ISubSequenceModifierListener<T>)null, arriModifier);
    }

    protected SequenceModifier(SequenceModifier<T> sequenceModifier) {
        super(sequenceModifier.mModifierListener);
        this.mSubSequenceModifierListener = sequenceModifier.mSubSequenceModifierListener;
        this.mDuration = sequenceModifier.mDuration;
        IModifier<T>[] arriModifier = sequenceModifier.mSubSequenceModifiers;
        IModifier<T>[] arriModifier2 = this.mSubSequenceModifiers = new IModifier[arriModifier.length];
        int n = -1 + arriModifier2.length;
        do {
            if (n < 0) {
                arriModifier2[0].setModifierListener(new InternalModifierListener(null));
                return;
            }
            arriModifier2[n] = arriModifier[n].clone();
            --n;
        } while (true);
    }

    public /* varargs */ SequenceModifier(IModifier<T> ... arriModifier) throws IllegalArgumentException {
        this((IModifier.IModifierListener<T>)null, arriModifier);
    }

    /*
     * Enabled aggressive block sorting
     */
    private void onHandleModifierFinished(SequenceModifier<T> sequenceModifier, IModifier<T> iModifier, T T) {
        this.mCurrentSubSequenceModifier = 1 + this.mCurrentSubSequenceModifier;
        if (this.mCurrentSubSequenceModifier < this.mSubSequenceModifiers.length) {
            this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].setModifierListener((IModifier.IModifierListener<T>)sequenceModifier);
            if (this.mSubSequenceModifierListener == null) return;
            this.mSubSequenceModifierListener.onSubSequenceFinished(iModifier, T, this.mCurrentSubSequenceModifier);
            return;
        }
        this.mFinished = true;
        if (this.mModifierListener == null) return;
        this.mModifierListener.onModifierFinished(this, T);
    }

    @Override
    public SequenceModifier<T> clone() {
        return new SequenceModifier<T>(this);
    }

    @Override
    public float getDuration() {
        return this.mDuration;
    }

    public ISubSequenceModifierListener<T> getSubSequenceModifierListener() {
        return this.mSubSequenceModifierListener;
    }

    @Override
    public void onUpdate(float f, T T) {
        if (this.mFinished) return;
        this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].onUpdate(f, T);
    }

    @Override
    public void reset() {
        this.mCurrentSubSequenceModifier = 0;
        this.mFinished = false;
        IModifier<T>[] arriModifier = this.mSubSequenceModifiers;
        int n = -1 + arriModifier.length;
        while (n >= 0) {
            arriModifier[n].reset();
            --n;
        }
        return;
    }

    public void setSubSequenceModifierListener(ISubSequenceModifierListener<T> iSubSequenceModifierListener) {
        this.mSubSequenceModifierListener = iSubSequenceModifierListener;
    }

    public interface ISubSequenceModifierListener<T> {
        public void onSubSequenceFinished(IModifier<T> var1, T var2, int var3);
    }

    class InternalModifierListener
    implements IModifier.IModifierListener<T> {
        private InternalModifierListener() {
        }

        /* synthetic */ InternalModifierListener(SequenceModifier sequenceModifier, InternalModifierListener internalModifierListener) {
            this();
        }

        @Override
        public void onModifierFinished(IModifier<T> iModifier, T T) {
            this$0.onHandleModifierFinished(this, iModifier, T);
        }
    }

}

