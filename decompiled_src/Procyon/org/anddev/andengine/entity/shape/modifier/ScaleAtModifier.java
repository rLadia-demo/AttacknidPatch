package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class ScaleAtModifier extends ScaleModifier
{
    private final float mScaleCenterX;
    private final float mScaleCenterY;
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5) {
        this(n, n2, n3, n4, n5, IEaseFunction.DEFAULT);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7) {
        this(n, n2, n3, n4, n5, n6, n7, IEaseFunction.DEFAULT);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IShapeModifierListener shapeModifierListener) {
        this(n, n2, n3, n4, n5, n6, n7, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float mScaleCenterX, final float mScaleCenterY, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, shapeModifierListener, easeFunction);
        this.mScaleCenterX = mScaleCenterX;
        this.mScaleCenterY = mScaleCenterY;
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, n6, n7, null, easeFunction);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener) {
        this(n, n2, n3, n4, n5, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        this(n, n2, n3, n2, n3, n4, n5, shapeModifierListener, easeFunction);
    }
    
    public ScaleAtModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, null, easeFunction);
    }
    
    protected ScaleAtModifier(final ScaleAtModifier scaleAtModifier) {
        super(scaleAtModifier);
        this.mScaleCenterX = scaleAtModifier.mScaleCenterX;
        this.mScaleCenterY = scaleAtModifier.mScaleCenterY;
    }
    
    @Override
    public ScaleAtModifier clone() {
        return new ScaleAtModifier(this);
    }
    
    @Override
    protected void onManagedInitialize(final IShape shape) {
        super.onManagedInitialize(shape);
        shape.setScaleCenter(this.mScaleCenterX, this.mScaleCenterY);
    }
}
