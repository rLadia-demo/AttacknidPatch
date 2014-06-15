package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class ScaleModifier extends BaseDoubleValueSpanModifier
{
    public ScaleModifier(final float n, final float n2, final float n3, final float n4) {
        this(n, n2, n, n2, n3, n4);
    }
    
    public ScaleModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        super(n, n2, n3, n4, n5, n6);
    }
    
    @Override
    protected void onSetInitialValues(final Particle particle, final float n, final float n2) {
        particle.setScale(n, n2);
    }
    
    @Override
    protected void onSetValues(final Particle particle, final float n, final float n2) {
        particle.setScale(n, n2);
    }
}
