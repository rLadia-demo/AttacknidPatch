package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.util.modifier.ease.*;

public abstract class DoubleValueSpanShapeModifier extends BaseDoubleValueSpanModifier<IShape> implements IShapeModifier
{
    public DoubleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5) {
        super(n, n2, n3, n4, n5);
    }
    
    public DoubleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, n4, n5, shapeModifierListener);
    }
    
    public DoubleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, shapeModifierListener, easeFunction);
    }
    
    public DoubleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, easeFunction);
    }
    
    protected DoubleValueSpanShapeModifier(final DoubleValueSpanShapeModifier doubleValueSpanShapeModifier) {
        super(doubleValueSpanShapeModifier);
    }
}
