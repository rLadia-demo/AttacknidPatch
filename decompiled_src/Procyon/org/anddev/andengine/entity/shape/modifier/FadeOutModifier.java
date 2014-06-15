package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;

public class FadeOutModifier extends AlphaModifier
{
    public FadeOutModifier(final float n) {
        super(n, 1.0f, 0.0f, IEaseFunction.DEFAULT);
    }
    
    public FadeOutModifier(final float n, final IShapeModifierListener shapeModifierListener) {
        super(n, 1.0f, 0.0f, shapeModifierListener, IEaseFunction.DEFAULT);
    }
    
    public FadeOutModifier(final float n, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        super(n, 1.0f, 0.0f, shapeModifierListener, easeFunction);
    }
    
    public FadeOutModifier(final float n, final IEaseFunction easeFunction) {
        super(n, 1.0f, 0.0f, easeFunction);
    }
    
    protected FadeOutModifier(final FadeOutModifier fadeOutModifier) {
        super(fadeOutModifier);
    }
    
    @Override
    public FadeOutModifier clone() {
        return new FadeOutModifier(this);
    }
}
