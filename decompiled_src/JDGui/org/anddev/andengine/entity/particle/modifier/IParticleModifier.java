package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public abstract interface IParticleModifier
  extends IParticleInitializer
{
  public abstract void onUpdateParticle(Particle paramParticle);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.IParticleModifier
 * JD-Core Version:    0.7.0.1
 */