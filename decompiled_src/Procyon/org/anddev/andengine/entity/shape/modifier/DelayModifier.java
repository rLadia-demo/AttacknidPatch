package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class DelayModifier extends DurationShapeModifier
{
    public DelayModifier(final float n) {
        super(n);
    }
    
    public DelayModifier(final float n, final IShapeModifierListener shapeModifierListener) {
        super(n, shapeModifierListener);
    }
    
    protected DelayModifier(final DelayModifier delayModifier) {
        super(delayModifier);
    }
    
    @Override
    public DelayModifier clone() {
        return new DelayModifier(this);
    }
    
    @Override
    protected void onManagedInitialize(final IShape shape) {
    }
    
    @Override
    protected void onManagedUpdate(final float n, final IShape shape) {
    }
}
