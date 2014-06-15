package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class RotationInitializer extends BaseSingleValueInitializer
{
    public RotationInitializer(final float n) {
        this(n, n);
    }
    
    public RotationInitializer(final float n, final float n2) {
        super(n, n2);
    }
    
    public float getMaxRotation() {
        return this.mMaxValue;
    }
    
    public float getMinRotation() {
        return this.mMinValue;
    }
    
    public void onInitializeParticle(final Particle particle, final float rotation) {
        particle.setRotation(rotation);
    }
    
    public void setRotation(final float n) {
        this.mMinValue = n;
        this.mMaxValue = n;
    }
    
    public void setRotation(final float mMinValue, final float mMaxValue) {
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
    }
}
