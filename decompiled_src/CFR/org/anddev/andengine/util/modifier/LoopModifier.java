/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.BaseModifier;
import org.anddev.andengine.util.modifier.IModifier;

public class LoopModifier<T>
extends BaseModifier<T> {
    public static final int LOOP_CONTINUOUS = -1;
    private final float mDuration;
    private final int mInitialLoopCount;
    private int mLoopCount;
    private ILoopModifierListener<T> mLoopModifierListener;
    private final IModifier<T> mModifier;

    public LoopModifier(int n, IModifier<T> iModifier) {
        this(null, n, iModifier);
    }

    public LoopModifier(IModifier.IModifierListener<T> iModifierListener, int n, IModifier<T> iModifier) {
        this(iModifierListener, n, null, iModifier);
    }

    /*
     * Enabled aggressive block sorting
     */
    public LoopModifier(IModifier.IModifierListener<T> iModifierListener, int n, ILoopModifierListener<T> iLoopModifierListener, IModifier<T> iModifier) {
        super(iModifierListener);
        this.mLoopModifierListener = iLoopModifierListener;
        this.mModifier = iModifier;
        this.mInitialLoopCount = n;
        this.mLoopCount = n;
        float f = n == -1 ? Infinityf : iModifier.getDuration() * (float)n;
        this.mDuration = f;
        iModifier.setModifierListener(new InternalModifierListener(null));
    }

    public LoopModifier(IModifier<T> iModifier) {
        this(null, -1, iModifier);
    }

    protected LoopModifier(LoopModifier<T> loopModifier) {
        this(loopModifier.mModifierListener, loopModifier.mInitialLoopCount, loopModifier.mModifier.clone());
    }

    @Override
    public LoopModifier<T> clone() {
        return new LoopModifier<T>(this);
    }

    @Override
    public float getDuration() {
        return this.mDuration;
    }

    public ILoopModifierListener<T> getLoopModifierListener() {
        return this.mLoopModifierListener;
    }

    /*
     * Enabled aggressive block sorting
     */
    public void onHandleLoopFinished(T T) {
        if (this.mLoopModifierListener != null) {
            this.mLoopModifierListener.onLoopFinished(this, this.mLoopCount);
        }
        if (this.mInitialLoopCount == -1) {
            this.mModifier.reset();
            return;
        }
        this.mLoopCount = -1 + this.mLoopCount;
        if (this.mLoopCount < 0) {
            this.mFinished = true;
            if (this.mModifierListener == null) return;
            this.mModifierListener.onModifierFinished(this, T);
            return;
        }
        this.mModifier.reset();
    }

    @Override
    public void onUpdate(float f, T T) {
        if (this.mFinished) return;
        this.mModifier.onUpdate(f, T);
    }

    @Override
    public void reset() {
        this.mLoopCount = this.mInitialLoopCount;
        this.mModifier.reset();
    }

    public void setLoopModifierListener(ILoopModifierListener<T> iLoopModifierListener) {
        this.mLoopModifierListener = iLoopModifierListener;
    }

    public interface ILoopModifierListener<T> {
        public void onLoopFinished(LoopModifier<T> var1, int var2);
    }

    class InternalModifierListener
    implements IModifier.IModifierListener<T> {
        private InternalModifierListener() {
        }

        /* synthetic */ InternalModifierListener(LoopModifier loopModifier, InternalModifierListener internalModifierListener) {
            this();
        }

        @Override
        public void onModifierFinished(IModifier<T> iModifier, T T) {
            this$0.onHandleLoopFinished(T);
        }
    }

}

