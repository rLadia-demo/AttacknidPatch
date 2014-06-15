package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class MoveModifier extends DoubleValueSpanShapeModifier
{
    public MoveModifier(final float n, final float n2, final float n3, final float n4, final float n5) {
        this(n, n2, n3, n4, n5, null, IEaseFunction.DEFAULT);
    }
    
    public MoveModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, n4, n5, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public MoveModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, shapeModifierListener, easeFunction);
    }
    
    public MoveModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, null, easeFunction);
    }
    
    protected MoveModifier(final MoveModifier moveModifier) {
        super(moveModifier);
    }
    
    @Override
    public MoveModifier clone() {
        return new MoveModifier(this);
    }
    
    @Override
    protected void onSetInitialValues(final IShape shape, final float n, final float n2) {
        shape.setPosition(n, n2);
    }
    
    @Override
    protected void onSetValues(final IShape shape, final float n, final float n2, final float n3) {
        shape.setPosition(n2, n3);
    }
}
