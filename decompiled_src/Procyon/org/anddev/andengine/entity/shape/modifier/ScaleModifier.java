package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class ScaleModifier extends DoubleValueSpanShapeModifier
{
    public ScaleModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final float n4, final float n5) {
        this(n, n2, n3, n4, n5, null, IEaseFunction.DEFAULT);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, n4, n5, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, shapeModifierListener, easeFunction);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final float n4, final float n5, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, null, easeFunction);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        this(n, n2, n3, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        this(n, n2, n3, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected ScaleModifier(final ScaleModifier scaleModifier) {
        super(scaleModifier);
    }
    
    @Override
    public ScaleModifier clone() {
        return new ScaleModifier(this);
    }
    
    @Override
    protected void onSetInitialValues(final IShape shape, final float n, final float n2) {
        shape.setScale(n, n2);
    }
    
    @Override
    protected void onSetValues(final IShape shape, final float n, final float n2, final float n3) {
        shape.setScale(n2, n3);
    }
}
