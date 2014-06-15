package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class RotationAtModifier extends RotationModifier
{
    private final float mRotationCenterX;
    private final float mRotationCenterY;
    
    public RotationAtModifier(final float n, final float n2, final float n3, final float mRotationCenterX, final float mRotationCenterY) {
        super(n, n2, n3, IEaseFunction.DEFAULT);
        this.mRotationCenterX = mRotationCenterX;
        this.mRotationCenterY = mRotationCenterY;
    }
    
    public RotationAtModifier(final float n, final float n2, final float n3, final float mRotationCenterX, final float mRotationCenterY, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
        this.mRotationCenterX = mRotationCenterX;
        this.mRotationCenterY = mRotationCenterY;
    }
    
    public RotationAtModifier(final float n, final float n2, final float n3, final float mRotationCenterX, final float mRotationCenterY, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
        this.mRotationCenterX = mRotationCenterX;
        this.mRotationCenterY = mRotationCenterY;
    }
    
    public RotationAtModifier(final float n, final float n2, final float n3, final float mRotationCenterX, final float mRotationCenterY, final IEaseFunction easeFunction) {
        super(n, n2, n3, easeFunction);
        this.mRotationCenterX = mRotationCenterX;
        this.mRotationCenterY = mRotationCenterY;
    }
    
    protected RotationAtModifier(final RotationAtModifier rotationAtModifier) {
        super(rotationAtModifier);
        this.mRotationCenterX = rotationAtModifier.mRotationCenterX;
        this.mRotationCenterY = rotationAtModifier.mRotationCenterY;
    }
    
    @Override
    public RotationAtModifier clone() {
        return new RotationAtModifier(this);
    }
    
    @Override
    protected void onManagedInitialize(final IShape shape) {
        super.onManagedInitialize(shape);
        shape.setRotationCenter(this.mRotationCenterX, this.mRotationCenterY);
    }
}
