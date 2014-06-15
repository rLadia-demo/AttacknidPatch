package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class ColorInitializer extends BaseTripleValueInitializer
{
    public ColorInitializer(final float n, final float n2, final float n3) {
        super(n, n, n2, n2, n3, n3);
    }
    
    public ColorInitializer(final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        super(n, n2, n3, n4, n5, n6);
    }
    
    @Override
    protected void onInitializeParticle(final Particle particle, final float n, final float n2, final float n3) {
        particle.setColor(n, n2, n3);
    }
}
