package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public abstract class SingleValueChangeShapeModifier extends BaseSingleValueChangeModifier<IShape> implements IShapeModifier
{
    public SingleValueChangeShapeModifier(final float n, final float n2) {
        super(n, n2);
    }
    
    public SingleValueChangeShapeModifier(final float n, final float n2, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, shapeModifierListener);
    }
    
    protected SingleValueChangeShapeModifier(final SingleValueChangeShapeModifier singleValueChangeShapeModifier) {
        super(singleValueChangeShapeModifier);
    }
}
