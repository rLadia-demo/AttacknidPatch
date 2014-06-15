package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public interface IParticleModifier extends IParticleInitializer
{
    void onUpdateParticle(Particle p0);
}
