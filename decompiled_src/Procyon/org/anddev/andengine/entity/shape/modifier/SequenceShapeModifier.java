package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public class SequenceShapeModifier extends SequenceModifier<IShape> implements IShapeModifier
{
    public SequenceShapeModifier(final IShapeModifierListener shapeModifierListener, final ISubSequenceShapeModifierListener subSequenceShapeModifierListener, final IShapeModifier... array) throws IllegalArgumentException {
        super(shapeModifierListener, (ISubSequenceModifierListener)subSequenceShapeModifierListener, (IModifier[])array);
    }
    
    public SequenceShapeModifier(final IShapeModifierListener shapeModifierListener, final IShapeModifier... array) throws IllegalArgumentException {
        super(shapeModifierListener, (IModifier[])array);
    }
    
    protected SequenceShapeModifier(final SequenceShapeModifier sequenceShapeModifier) {
        super(sequenceShapeModifier);
    }
    
    public SequenceShapeModifier(final IShapeModifier... array) throws IllegalArgumentException {
        super((IModifier[])array);
    }
    
    @Override
    public SequenceShapeModifier clone() {
        return new SequenceShapeModifier(this);
    }
    
    public interface ISubSequenceShapeModifierListener extends ISubSequenceModifierListener<IShape>
    {
    }
}
