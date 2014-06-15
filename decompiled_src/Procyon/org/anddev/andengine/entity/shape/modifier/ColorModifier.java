package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class ColorModifier extends TripleValueSpanShapeModifier
{
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7) {
        this(n, n2, n3, n4, n5, n6, n7, null, IEaseFunction.DEFAULT);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, n4, n5, n6, n7, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, n6, n7, shapeModifierListener, easeFunction);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, n6, n7, null, easeFunction);
    }
    
    protected ColorModifier(final ColorModifier colorModifier) {
        super(colorModifier);
    }
    
    @Override
    public ColorModifier clone() {
        return new ColorModifier(this);
    }
    
    @Override
    protected void onSetInitialValues(final IShape shape, final float n, final float n2, final float n3) {
        shape.setColor(n, n2, n3);
    }
    
    @Override
    protected void onSetValues(final IShape shape, final float n, final float n2, final float n3, final float n4) {
        shape.setColor(n2, n3, n4);
    }
}
