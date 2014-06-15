package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class RotationModifier extends SingleValueSpanShapeModifier
{
    public RotationModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public RotationModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public RotationModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public RotationModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected RotationModifier(final RotationModifier rotationModifier) {
        super(rotationModifier);
    }
    
    @Override
    public RotationModifier clone() {
        return new RotationModifier(this);
    }
    
    @Override
    protected void onSetInitialValue(final IShape shape, final float rotation) {
        shape.setRotation(rotation);
    }
    
    @Override
    protected void onSetValue(final IShape shape, final float n, final float rotation) {
        shape.setRotation(rotation);
    }
}
