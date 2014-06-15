package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;

public abstract class TripleValueSpanShapeModifier extends BaseTripleValueSpanModifier<IShape> implements IShapeModifier
{
    public TripleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, n6, n7, shapeModifierListener, easeFunction);
    }
    
    public TripleValueSpanShapeModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, n6, n7, easeFunction);
    }
    
    protected TripleValueSpanShapeModifier(final TripleValueSpanShapeModifier tripleValueSpanShapeModifier) {
        super(tripleValueSpanShapeModifier);
    }
}
