package org.anddev.andengine.util.modifier;

import org.anddev.andengine.util.modifier.ease.*;

public abstract class BaseDoubleValueSpanModifier<T> extends BaseSingleValueSpanModifier<T>
{
    private final float mFromValueB;
    private final float mValueSpanB;
    
    public BaseDoubleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float n5) {
        this(n, n2, n3, n4, n5, null, IEaseFunction.DEFAULT);
    }
    
    public BaseDoubleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IModifierListener<T> modifierListener) {
        this(n, n2, n3, n4, n5, modifierListener, IEaseFunction.DEFAULT);
    }
    
    public BaseDoubleValueSpanModifier(final float n, final float n2, final float n3, final float mFromValueB, final float n4, final IModifierListener<T> modifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, modifierListener, easeFunction);
        this.mFromValueB = mFromValueB;
        this.mValueSpanB = n4 - mFromValueB;
    }
    
    public BaseDoubleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, null, easeFunction);
    }
    
    protected BaseDoubleValueSpanModifier(final BaseDoubleValueSpanModifier<T> baseDoubleValueSpanModifier) {
        super(baseDoubleValueSpanModifier);
        this.mFromValueB = baseDoubleValueSpanModifier.mFromValueB;
        this.mValueSpanB = baseDoubleValueSpanModifier.mValueSpanB;
    }
    
    @Override
    protected void onSetInitialValue(final T t, final float n) {
        this.onSetInitialValues(t, n, this.mFromValueB);
    }
    
    protected abstract void onSetInitialValues(final T p0, final float p1, final float p2);
    
    @Override
    protected void onSetValue(final T t, final float n, final float n2) {
        this.onSetValues(t, n, n2, this.mFromValueB + n * this.mValueSpanB);
    }
    
    protected abstract void onSetValues(final T p0, final float p1, final float p2, final float p3);
}
