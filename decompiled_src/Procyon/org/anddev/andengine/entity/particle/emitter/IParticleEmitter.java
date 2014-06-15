package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.engine.handler.*;

public interface IParticleEmitter extends IUpdateHandler
{
    void getPositionOffset(float[] p0);
}
