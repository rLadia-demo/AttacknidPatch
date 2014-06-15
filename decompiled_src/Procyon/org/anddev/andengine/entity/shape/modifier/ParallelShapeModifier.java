package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public class ParallelShapeModifier extends ParallelModifier<IShape> implements IShapeModifier
{
    public ParallelShapeModifier(final IShapeModifierListener shapeModifierListener, final IShapeModifier... array) throws IllegalArgumentException {
        super(shapeModifierListener, (IModifier[])array);
    }
    
    protected ParallelShapeModifier(final ParallelShapeModifier parallelShapeModifier) {
        super(parallelShapeModifier);
    }
    
    public ParallelShapeModifier(final IShapeModifier... array) throws IllegalArgumentException {
        super((IModifier[])array);
    }
    
    @Override
    public ParallelShapeModifier clone() {
        return new ParallelShapeModifier(this);
    }
}
