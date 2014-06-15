package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class MoveXModifier extends SingleValueSpanShapeModifier
{
    public MoveXModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public MoveXModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public MoveXModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public MoveXModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected MoveXModifier(final MoveXModifier moveXModifier) {
        super(moveXModifier);
    }
    
    @Override
    public MoveXModifier clone() {
        return new MoveXModifier(this);
    }
    
    @Override
    protected void onSetInitialValue(final IShape shape, final float n) {
        shape.setPosition(n, shape.getY());
    }
    
    @Override
    protected void onSetValue(final IShape shape, final float n, final float n2) {
        shape.setPosition(n2, shape.getY());
    }
}
