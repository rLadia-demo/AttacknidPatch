package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class RotationByModifier extends SingleValueChangeShapeModifier
{
    public RotationByModifier(final float n, final float n2) {
        super(n, n2);
    }
    
    protected RotationByModifier(final RotationByModifier rotationByModifier) {
        super(rotationByModifier);
    }
    
    @Override
    public RotationByModifier clone() {
        return new RotationByModifier(this);
    }
    
    @Override
    protected void onChangeValue(final IShape shape, final float n) {
        shape.setRotation(n + shape.getRotation());
    }
}
