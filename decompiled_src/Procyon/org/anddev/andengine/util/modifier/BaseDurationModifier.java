package org.anddev.andengine.util.modifier;

public abstract class BaseDurationModifier<T> extends BaseModifier<T>
{
    protected final float mDuration;
    private float mTotalSecondsElapsed;
    
    public BaseDurationModifier() {
        this(-1.0f, null);
    }
    
    public BaseDurationModifier(final float n) {
        this(n, null);
    }
    
    public BaseDurationModifier(final float mDuration, final IModifierListener<T> modifierListener) {
        super(modifierListener);
        this.mDuration = mDuration;
    }
    
    protected BaseDurationModifier(final BaseDurationModifier<T> baseDurationModifier) {
        this(baseDurationModifier.mDuration, baseDurationModifier.mModifierListener);
    }
    
    @Override
    public float getDuration() {
        return this.mDuration;
    }
    
    protected float getTotalSecondsElapsed() {
        return this.mTotalSecondsElapsed;
    }
    
    protected abstract void onManagedInitialize(final T p0);
    
    protected abstract void onManagedUpdate(final float p0, final T p1);
    
    @Override
    public final void onUpdate(final float n, final T t) {
        if (!this.mFinished) {
            if (this.mTotalSecondsElapsed == 0.0f) {
                this.onManagedInitialize(t);
            }
            float n2;
            if (n + this.mTotalSecondsElapsed < this.mDuration) {
                n2 = n;
            }
            else {
                n2 = this.mDuration - this.mTotalSecondsElapsed;
            }
            this.mTotalSecondsElapsed += n2;
            this.onManagedUpdate(n2, t);
            if (this.mDuration != -1.0f && this.mTotalSecondsElapsed >= this.mDuration) {
                this.mTotalSecondsElapsed = this.mDuration;
                this.mFinished = true;
                if (this.mModifierListener != null) {
                    this.mModifierListener.onModifierFinished(this, t);
                }
            }
        }
    }
    
    @Override
    public void reset() {
        this.mFinished = false;
        this.mTotalSecondsElapsed = 0.0f;
    }
}
