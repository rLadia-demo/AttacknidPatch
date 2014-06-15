package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public abstract class DurationShapeModifier extends BaseDurationModifier<IShape> implements IShapeModifier
{
    public DurationShapeModifier() {
        super();
    }
    
    public DurationShapeModifier(final float n) {
        super(n);
    }
    
    public DurationShapeModifier(final float n, final IShapeModifierListener shapeModifierListener) {
        super(n, shapeModifierListener);
    }
    
    protected DurationShapeModifier(final DurationShapeModifier durationShapeModifier) {
        super(durationShapeModifier);
    }
}
