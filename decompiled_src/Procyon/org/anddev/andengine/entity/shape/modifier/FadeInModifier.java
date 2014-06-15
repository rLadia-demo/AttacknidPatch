package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;

public class FadeInModifier extends AlphaModifier
{
    public FadeInModifier(final float n) {
        super(n, 0.0f, 1.0f, IEaseFunction.DEFAULT);
    }
    
    public FadeInModifier(final float n, final IShapeModifierListener shapeModifierListener) {
        super(n, 0.0f, 1.0f, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public FadeInModifier(final float n, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, 0.0f, 1.0f, shapeModifierListener, easeFunction);
    }
    
    public FadeInModifier(final float n, final IEaseFunction easeFunction) {
        super(n, 0.0f, 1.0f, easeFunction);
    }
    
    protected FadeInModifier(final FadeInModifier fadeInModifier) {
        super(fadeInModifier);
    }
    
    @Override
    public FadeInModifier clone() {
        return new FadeInModifier(this);
    }
}
