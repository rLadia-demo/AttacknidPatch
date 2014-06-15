package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class MoveYModifier extends SingleValueSpanShapeModifier
{
    public MoveYModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public MoveYModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public MoveYModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public MoveYModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected MoveYModifier(final MoveYModifier moveYModifier) {
        super(moveYModifier);
    }
    
    @Override
    public MoveYModifier clone() {
        return new MoveYModifier(this);
    }
    
    @Override
    protected void onSetInitialValue(final IShape shape, final float n) {
        shape.setPosition(shape.getX(), n);
    }
    
    @Override
    protected void onSetValue(final IShape shape, final float n, final float n2) {
        shape.setPosition(shape.getX(), n2);
    }
}
