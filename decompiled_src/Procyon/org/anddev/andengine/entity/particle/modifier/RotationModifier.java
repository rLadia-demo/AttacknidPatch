package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class RotationModifier extends BaseSingleValueSpanModifier
{
    public RotationModifier(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    @Override
    protected void onSetInitialValue(final Particle particle, final float rotation) {
        particle.setRotation(rotation);
    }
    
    @Override
    protected void onSetValue(final Particle particle, final float rotation) {
        particle.setRotation(rotation);
    }
}
