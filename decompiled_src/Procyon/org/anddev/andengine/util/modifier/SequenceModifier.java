package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.util.*;

public class SequenceModifier<T> extends BaseModifier<T>
{
    private int mCurrentSubSequenceModifier;
    private final float mDuration;
    private ISubSequenceModifierListener<T> mSubSequenceModifierListener;
    private final IModifier<T>[] mSubSequenceModifiers;
    
    public SequenceModifier(final IModifierListener<T> modifierListener, final ISubSequenceModifierListener<T> mSubSequenceModifierListener, final IModifier<T>... mSubSequenceModifiers) throws IllegalArgumentException {
        super(modifierListener);
        if (mSubSequenceModifiers.length == 0) {
            throw new IllegalArgumentException("pModifiers must not be empty!");
        }
        this.mSubSequenceModifierListener = mSubSequenceModifierListener;
        this.mSubSequenceModifiers = mSubSequenceModifiers;
        this.mDuration = ModifierUtils.getSequenceDurationOfModifier(mSubSequenceModifiers);
        mSubSequenceModifiers[0].setModifierListener((IModifier.IModifierListener<T>)new InternalModifierListener((InternalModifierListener)null));
    }
    
    public SequenceModifier(final IModifierListener<T> modifierListener, final IModifier<T>... array) throws IllegalArgumentException {
        this(modifierListener, (ISubSequenceModifierListener)null, (IModifier[])array);
    }
    
    protected SequenceModifier(final SequenceModifier<T> sequenceModifier) {
        super(sequenceModifier.mModifierListener);
        this.mSubSequenceModifierListener = sequenceModifier.mSubSequenceModifierListener;
        this.mDuration = sequenceModifier.mDuration;
        final IModifier<T>[] mSubSequenceModifiers = sequenceModifier.mSubSequenceModifiers;
        this.mSubSequenceModifiers = (IModifier<T>[])new IModifier[mSubSequenceModifiers.length];
        final IModifier<T>[] mSubSequenceModifiers2 = this.mSubSequenceModifiers;
        for (int i = -1 + mSubSequenceModifiers2.length; i >= 0; --i) {
            mSubSequenceModifiers2[i] = mSubSequenceModifiers[i].clone();
        }
        mSubSequenceModifiers2[0].setModifierListener((IModifier.IModifierListener<T>)new InternalModifierListener((InternalModifierListener)null));
    }
    
    public SequenceModifier(final IModifier<T>... array) throws IllegalArgumentException {
        this((IModifierListener)null, (IModifier[])array);
    }
    
    private void onHandleModifierFinished(final InternalModifierListener modifierListener, final IModifier<T> modifier, final T t) {
        ++this.mCurrentSubSequenceModifier;
        if (this.mCurrentSubSequenceModifier < this.mSubSequenceModifiers.length) {
            this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].setModifierListener((IModifier.IModifierListener<T>)modifierListener);
            if (this.mSubSequenceModifierListener != null) {
                this.mSubSequenceModifierListener.onSubSequenceFinished(modifier, t, this.mCurrentSubSequenceModifier);
            }
        }
        else {
            this.mFinished = true;
            if (this.mModifierListener != null) {
                this.mModifierListener.onModifierFinished(this, t);
            }
        }
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
    public void onUpdate(final float n, final T t) {
        if (!this.mFinished) {
            this.mSubSequenceModifiers[this.mCurrentSubSequenceModifier].onUpdate(n, t);
        }
    }
    
    @Override
    public void reset() {
        this.mCurrentSubSequenceModifier = 0;
        this.mFinished = false;
        final IModifier<T>[] mSubSequenceModifiers = this.mSubSequenceModifiers;
        for (int i = -1 + mSubSequenceModifiers.length; i >= 0; --i) {
            mSubSequenceModifiers[i].reset();
        }
    }
    
    public void setSubSequenceModifierListener(final ISubSequenceModifierListener<T> mSubSequenceModifierListener) {
        this.mSubSequenceModifierListener = mSubSequenceModifierListener;
    }
    
    public interface ISubSequenceModifierListener<T>
    {
        void onSubSequenceFinished(IModifier<T> p0, T p1, int p2);
    }
    
    private class InternalModifierListener implements IModifierListener<T>
    {
        @Override
        public void onModifierFinished(final IModifier<T> modifier, final T t) {
            SequenceModifier.this.onHandleModifierFinished(this, modifier, t);
        }
    }
}
