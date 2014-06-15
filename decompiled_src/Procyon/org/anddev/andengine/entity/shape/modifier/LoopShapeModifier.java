package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.*;

public class LoopShapeModifier extends LoopModifier<IShape> implements IShapeModifier
{
    public LoopShapeModifier(final int n, final IShapeModifier shapeModifier) {
        super(n, shapeModifier);
    }
    
    public LoopShapeModifier(final IShapeModifierListener shapeModifierListener, final int n, final IShapeModifier shapeModifier) {
        super(shapeModifierListener, n, shapeModifier);
    }
    
    public LoopShapeModifier(final IShapeModifierListener shapeModifierListener, final int n, final ILoopShapeModifierListener loopShapeModifierListener, final IShapeModifier shapeModifier) {
        super(shapeModifierListener, n, (ILoopModifierListener)loopShapeModifierListener, shapeModifier);
    }
    
    public LoopShapeModifier(final IShapeModifier shapeModifier) {
        super(shapeModifier);
    }
    
    protected LoopShapeModifier(final LoopShapeModifier loopShapeModifier) {
        super(loopShapeModifier);
    }
    
    @Override
    public LoopShapeModifier clone() {
        return new LoopShapeModifier(this);
    }
    
    public interface ILoopShapeModifierListener extends ILoopModifierListener<IShape>
    {
    }
}
