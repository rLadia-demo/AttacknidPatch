package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class ColorModifier extends BaseTripleValueSpanModifier
{
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final float n8) {
        super(n, n2, n3, n4, n5, n6, n7, n8);
    }
    
    @Override
    protected void onSetInitialValues(final Particle particle, final float n, final float n2, final float n3) {
        particle.setColor(n, n2, n3);
    }
    
    @Override
    protected void onSetValues(final Particle particle, final float n, final float n2, final float n3) {
        particle.setColor(n, n2, n3);
    }
}
