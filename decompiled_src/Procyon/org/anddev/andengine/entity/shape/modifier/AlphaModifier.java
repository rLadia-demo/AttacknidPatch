package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;

public class AlphaModifier extends SingleValueSpanShapeModifier
{
    public AlphaModifier(final float n, final float n2, final float n3) {
        this(n, n2, n3, null, IEaseFunction.DEFAULT);
    }
    
    public AlphaModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener) {
        super(n, n2, n3, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public AlphaModifier(final float n, final float n2, final float n3, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, shapeModifierListener, easeFunction);
    }
    
    public AlphaModifier(final float n, final float n2, final float n3, final IEaseFunction easeFunction) {
        this(n, n2, n3, null, easeFunction);
    }
    
    protected AlphaModifier(final AlphaModifier alphaModifier) {
        super(alphaModifier);
    }
    
    @Override
    public AlphaModifier clone() {
        return new AlphaModifier(this);
    }
    
    @Override
    protected void onSetInitialValue(final IShape shape, final float alpha) {
        shape.setAlpha(alpha);
    }
    
    @Override
    protected void onSetValue(final IShape shape, final float n, final float alpha) {
        shape.setAlpha(alpha);
    }
}
