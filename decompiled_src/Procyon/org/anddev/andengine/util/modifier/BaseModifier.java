package org.anddev.andengine.util.modifier;

public abstract class BaseModifier<T> implements IModifier<T>
{
    protected boolean mFinished;
    protected IModifierListener<T> mModifierListener;
    private boolean mRemoveWhenFinished;
    
    public BaseModifier() {
        this((IModifierListener)null);
    }
    
    protected BaseModifier(final BaseModifier<T> baseModifier) {
        this(baseModifier.mModifierListener);
    }
    
    public BaseModifier(final IModifierListener<T> mModifierListener) {
        super();
        this.mRemoveWhenFinished = true;
        this.mModifierListener = mModifierListener;
    }
    
    @Override
    public abstract IModifier<T> clone();
    
    @Override
    public IModifierListener<T> getModifierListener() {
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
    public void setModifierListener(final IModifierListener<T> mModifierListener) {
        this.mModifierListener = mModifierListener;
    }
    
    @Override
    public final void setRemoveWhenFinished(final boolean mRemoveWhenFinished) {
        this.mRemoveWhenFinished = mRemoveWhenFinished;
    }
}
