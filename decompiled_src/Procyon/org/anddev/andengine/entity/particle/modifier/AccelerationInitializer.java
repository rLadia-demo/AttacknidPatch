package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class AccelerationInitializer extends BaseDoubleValueInitializer
{
    public AccelerationInitializer(final float n) {
        this(n, n);
    }
    
    public AccelerationInitializer(final float n, final float n2) {
        this(n, n, n2, n2);
    }
    
    public AccelerationInitializer(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    public float getMaxAccelerationX() {
        return this.mMaxValue;
    }
    
    public float getMaxAccelerationY() {
        return this.mMaxValueB;
    }
    
    public float getMinAccelerationX() {
        return this.mMinValue;
    }
    
    public float getMinAccelerationY() {
        return this.mMinValueB;
    }
    
    public void onInitializeParticle(final Particle particle, final float n, final float n2) {
        particle.accelerate(n, n2);
    }
    
    public void setAcceleration(final float mMinValue, final float mMaxValue, final float mMinValueB, final float mMaxValueB) {
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
        this.mMinValueB = mMinValueB;
        this.mMaxValueB = mMaxValueB;
    }
    
    public void setAccelerationX(final float n) {
        this.mMinValue = n;
        this.mMaxValue = n;
    }
    
    public void setAccelerationX(final float mMinValue, final float mMaxValue) {
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
    }
    
    public void setAccelerationY(final float n) {
        this.mMinValueB = n;
        this.mMaxValueB = n;
    }
    
    public void setAccelerationY(final float mMinValueB, final float mMaxValueB) {
        this.mMinValueB = mMinValueB;
        this.mMaxValueB = mMaxValueB;
    }
}
