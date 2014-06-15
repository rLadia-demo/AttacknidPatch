package org.anddev.andengine.entity.particle.emitter;

public class PointParticleEmitter extends BaseParticleEmitter
{
    public PointParticleEmitter(final float n, final float n2) {
        super(n, n2);
    }
    
    @Override
    public void getPositionOffset(final float[] array) {
        array[0] = this.mCenterX;
        array[1] = this.mCenterY;
    }
}
