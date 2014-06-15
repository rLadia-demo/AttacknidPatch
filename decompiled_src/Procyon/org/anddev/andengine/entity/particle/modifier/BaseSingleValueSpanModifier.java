package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public abstract class BaseSingleValueSpanModifier implements IParticleModifier
{
    private final float mDuration;
    private final float mFromTime;
    private final float mFromValue;
    private final float mSpanValue;
    private final float mToTime;
    private final float mToValue;
    
    public BaseSingleValueSpanModifier(final float mFromValue, final float mToValue, final float mFromTime, final float mToTime) {
        super();
        this.mFromValue = mFromValue;
        this.mToValue = mToValue;
        this.mFromTime = mFromTime;
        this.mToTime = mToTime;
        this.mSpanValue = this.mToValue - this.mFromValue;
        this.mDuration = this.mToTime - this.mFromTime;
    }
    
    protected final float calculateValue(final float n) {
        return this.mFromValue + n * this.mSpanValue;
    }
    
    @Override
    public void onInitializeParticle(final Particle particle) {
        this.onSetInitialValue(particle, this.mFromValue);
    }
    
    protected abstract void onSetInitialValue(final Particle p0, final float p1);
    
    protected abstract void onSetValue(final Particle p0, final float p1);
    
    protected void onSetValueInternal(final Particle particle, final float n) {
        this.onSetValue(particle, this.calculateValue(n));
    }
    
    @Override
    public void onUpdateParticle(final Particle particle) {
        final float lifeTime = particle.getLifeTime();
        if (lifeTime > this.mFromTime && lifeTime < this.mToTime) {
            this.onSetValueInternal(particle, (lifeTime - this.mFromTime) / this.mDuration);
        }
    }
}
