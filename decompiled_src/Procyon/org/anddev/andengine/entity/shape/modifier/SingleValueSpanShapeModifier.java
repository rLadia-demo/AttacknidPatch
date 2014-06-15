package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.util.modifier.ease.*;

public abstract class SingleValueSpanShapeModifier extends BaseSingleValueSpanModifier<IShape> implements IShapeModifier
{
    public SingleValueSpanShapeModifier(final float n, final float n2, final float n3) {
        super(n, n2, n3);
    }
    
    public SingleValueSpanShapeModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener);
    }
    
    public SingleValueSpanShapeModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public SingleValueSpanShapeModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        super(n, n2, n3, easeFunction);
    }
    
    protected SingleValueSpanShapeModifier(final SingleValueSpanShapeModifier singleValueSpanShapeModifier) {
        super(singleValueSpanShapeModifier);
    }
}
