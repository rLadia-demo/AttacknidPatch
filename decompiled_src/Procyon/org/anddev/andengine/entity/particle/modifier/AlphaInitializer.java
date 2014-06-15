package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class AlphaInitializer extends BaseSingleValueInitializer
{
    public AlphaInitializer(final float n) {
        super(n, n);
    }
    
    public AlphaInitializer(final float n, final float n2) {
        super(n, n2);
    }
    
    @Override
    protected void onInitializeParticle(final Particle particle, final float alpha) {
        particle.setAlpha(alpha);
    }
}
