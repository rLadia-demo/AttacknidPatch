package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.*;

public abstract class BaseTripleValueSpanModifier<T> extends BaseDoubleValueSpanModifier<T>
{
    private final float mFromValueC;
    private final float mValueSpanC;
    
    public BaseTripleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float mFromValueC, final float n6, final IModifierListener<T> modifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, modifierListener, easeFunction);
        this.mFromValueC = mFromValueC;
        this.mValueSpanC = n6 - mFromValueC;
    }
    
    public BaseTripleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, n6, n7, null, easeFunction);
    }
    
    protected BaseTripleValueSpanModifier(final BaseTripleValueSpanModifier<T> baseTripleValueSpanModifier) {
        super(baseTripleValueSpanModifier);
        this.mFromValueC = baseTripleValueSpanModifier.mFromValueC;
        this.mValueSpanC = baseTripleValueSpanModifier.mValueSpanC;
    }
    
    @Override
    protected void onSetInitialValues(final T t, final float n, final float n2) {
        this.onSetInitialValues(t, n, n2, this.mFromValueC);
    }
    
    protected abstract void onSetInitialValues(final T p0, final float p1, final float p2, final float p3);
    
    @Override
    protected void onSetValues(final T t, final float n, final float n2, final float n3) {
        this.onSetValues(t, n, n2, n3, this.mFromValueC + n * this.mValueSpanC);
    }
    
    protected abstract void onSetValues(final T p0, final float p1, final float p2, final float p3, final float p4);
}
