package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.util.*;

public class ParallelModifier<T> extends BaseModifier<T>
{
    private final float mDuration;
    private boolean mFinishedCached;
    private final IModifier<T>[] mModifiers;
    
    public ParallelModifier(final IModifierListener<T> modifierListener, final IModifier<T>... mModifiers) throws IllegalArgumentException {
        super(modifierListener);
        if (mModifiers.length == 0) {
            throw new IllegalArgumentException("pModifiers must not be empty!");
        }
        this.mModifiers = mModifiers;
        final IModifier<T> modifierWithLongestDuration = ModifierUtils.getModifierWithLongestDuration(mModifiers);
        this.mDuration = modifierWithLongestDuration.getDuration();
        modifierWithLongestDuration.setModifierListener((IModifier.IModifierListener<T>)new InternalModifierListener((InternalModifierListener)null));
    }
    
    protected ParallelModifier(final ParallelModifier<T> parallelModifier) {
        super(parallelModifier.mModifierListener);
        final IModifier<T>[] mModifiers = parallelModifier.mModifiers;
        this.mModifiers = (IModifier<T>[])new IModifier[mModifiers.length];
        final IModifier<T>[] mModifiers2 = this.mModifiers;
        for (int i = -1 + mModifiers2.length; i >= 0; --i) {
            mModifiers2[i] = mModifiers[i].clone();
        }
        final IModifier<T> modifierWithLongestDuration = ModifierUtils.getModifierWithLongestDuration(mModifiers2);
        this.mDuration = modifierWithLongestDuration.getDuration();
        modifierWithLongestDuration.setModifierListener((IModifier.IModifierListener<T>)new InternalModifierListener((InternalModifierListener)null));
    }
    
    public ParallelModifier(final IModifier<T>... array) throws IllegalArgumentException {
        this((IModifierListener)null, (IModifier[])array);
    }
    
    static /* synthetic */ void access$1(final ParallelModifier parallelModifier, final boolean mFinishedCached) {
        parallelModifier.mFinishedCached = mFinishedCached;
    }
    
    @Override
    public ParallelModifier<T> clone() {
        return new ParallelModifier<T>(this);
    }
    
    @Override
    public float getDuration() {
        return this.mDuration;
    }
    
    @Override
    public void onUpdate(final float n, final T t) {
        this.mFinishedCached = false;
        final IModifier<T>[] mModifiers = this.mModifiers;
        for (int i = -1 + mModifiers.length; i >= 0; --i) {
            mModifiers[i].onUpdate(n, t);
            if (this.mFinishedCached) {
                return;
            }
        }
        this.mFinishedCached = false;
    }
    
    @Override
    public void reset() {
        this.mFinished = false;
        final IModifier<T>[] mModifiers = this.mModifiers;
        for (int i = -1 + mModifiers.length; i >= 0; --i) {
            mModifiers[i].reset();
        }
    }
    
    private class InternalModifierListener implements IModifierListener<T>
    {
        @Override
        public void onModifierFinished(final IModifier<T> modifier, final T t) {
            ParallelModifier.this.mFinished = true;
            ParallelModifier.access$1(ParallelModifier.this, true);
            if (ParallelModifier.this.mModifierListener != null) {
                ParallelModifier.this.mModifierListener.onModifierFinished(ParallelModifier.this, (T)t);
            }
        }
    }
}
