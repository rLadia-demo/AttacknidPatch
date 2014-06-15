package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class AlphaModifier extends BaseSingleValueSpanModifier
{
    public AlphaModifier(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    @Override
    protected void onSetInitialValue(final Particle particle, final float alpha) {
        particle.setAlpha(alpha);
    }
    
    @Override
    protected void onSetValue(final Particle particle, final float alpha) {
        particle.setAlpha(alpha);
    }
}
