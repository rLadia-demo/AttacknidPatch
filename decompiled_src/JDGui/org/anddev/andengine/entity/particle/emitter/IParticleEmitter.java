package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.engine.handler.IUpdateHandler;

public abstract interface IParticleEmitter
  extends IUpdateHandler
{
  public abstract void getPositionOffset(float[] paramArrayOfFloat);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.IParticleEmitter
 * JD-Core Version:    0.7.0.1
 */