package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.particle.*;

public abstract class BaseSingleValueInitializer implements IParticleInitializer
{
    protected float mMaxValue;
    protected float mMinValue;
    
    public BaseSingleValueInitializer(final float mMinValue, final float mMaxValue) {
        super();
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
    }
    
    private final float getRandomValue() {
        if (this.mMinValue == this.mMaxValue) {
            return this.mMaxValue;
        }
        return MathUtils.RANDOM.nextFloat() * (this.mMaxValue - this.mMinValue) + this.mMinValue;
    }
    
    @Override
    public void onInitializeParticle(final Particle particle) {
        this.onInitializeParticle(particle, this.getRandomValue());
    }
    
    protected abstract void onInitializeParticle(final Particle p0, final float p1);
}
