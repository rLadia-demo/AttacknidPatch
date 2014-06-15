package org.anddev.andengine.util.modifier;

public class LoopModifier<T> extends BaseModifier<T>
{
    public static final int LOOP_CONTINUOUS = -1;
    private final float mDuration;
    private final int mInitialLoopCount;
    private int mLoopCount;
    private ILoopModifierListener<T> mLoopModifierListener;
    private final IModifier<T> mModifier;
    
    public LoopModifier(final int n, final IModifier<T> modifier) {
        this(null, n, modifier);
    }
    
    public LoopModifier(final IModifierListener<T> modifierListener, final int n, final IModifier<T> modifier) {
        this(modifierListener, n, null, modifier);
    }
    
    public LoopModifier(final IModifierListener<T> modifierListener, final int n, final ILoopModifierListener<T> mLoopModifierListener, final IModifier<T> mModifier) {
        super(modifierListener);
        this.mLoopModifierListener = mLoopModifierListener;
        this.mModifier = mModifier;
        this.mInitialLoopCount = n;
        this.mLoopCount = n;
        float mDuration;
        if (n == -1) {
            mDuration = Float.POSITIVE_INFINITY;
        }
        else {
            mDuration = mModifier.getDuration() * n;
        }
        this.mDuration = mDuration;
        mModifier.setModifierListener((IModifier.IModifierListener<T>)new InternalModifierListener((InternalModifierListener)null));
    }
    
    public LoopModifier(final IModifier<T> modifier) {
        this(null, -1, modifier);
    }
    
    protected LoopModifier(final LoopModifier<T> loopModifier) {
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
    
    public void onHandleLoopFinished(final T t) {
        if (this.mLoopModifierListener != null) {
            this.mLoopModifierListener.onLoopFinished(this, this.mLoopCount);
        }
        if (this.mInitialLoopCount == -1) {
            this.mModifier.reset();
        }
        else {
            --this.mLoopCount;
            if (this.mLoopCount >= 0) {
                this.mModifier.reset();
                return;
            }
            this.mFinished = true;
            if (this.mModifierListener != null) {
                this.mModifierListener.onModifierFinished(this, t);
            }
        }
    }
    
    @Override
    public void onUpdate(final float n, final T t) {
        if (!this.mFinished) {
            this.mModifier.onUpdate(n, t);
        }
    }
    
    @Override
    public void reset() {
        this.mLoopCount = this.mInitialLoopCount;
        this.mModifier.reset();
    }
    
    public void setLoopModifierListener(final ILoopModifierListener<T> mLoopModifierListener) {
        this.mLoopModifierListener = mLoopModifierListener;
    }
    
    public interface ILoopModifierListener<T>
    {
        void onLoopFinished(LoopModifier<T> p0, int p1);
    }
    
    private class InternalModifierListener implements IModifierListener<T>
    {
        @Override
        public void onModifierFinished(final IModifier<T> modifier, final T t) {
            LoopModifier.this.onHandleLoopFinished(t);
        }
    }
}
