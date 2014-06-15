package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public abstract class ShapeModifier extends BaseModifier<IShape> implements IShapeModifier
{
    public ShapeModifier() {
        super();
    }
    
    public ShapeModifier(final IShapeModifierListener shapeModifierListener) {
        super(shapeModifierListener);
    }
    
    protected ShapeModifier(final ShapeModifier shapeModifier) {
        super(shapeModifier);
    }
}
