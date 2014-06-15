package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public class VelocityInitializer extends BaseDoubleValueInitializer
{
    public VelocityInitializer(final float n) {
        this(n, n, n, n);
    }
    
    public VelocityInitializer(final float n, final float n2) {
        this(n, n, n2, n2);
    }
    
    public VelocityInitializer(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    public float getMaxVelocityX() {
        return this.mMaxValue;
    }
    
    public float getMaxVelocityY() {
        return this.mMaxValueB;
    }
    
    public float getMinVelocityX() {
        return this.mMinValue;
    }
    
    public float getMinVelocityY() {
        return this.mMinValueB;
    }
    
    public void onInitializeParticle(final Particle particle, final float n, final float n2) {
        particle.setVelocity(n, n2);
    }
    
    public void setVelocity(final float mMinValue, final float mMaxValue, final float mMinValueB, final float mMaxValueB) {
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
        this.mMinValueB = mMinValueB;
        this.mMaxValueB = mMaxValueB;
    }
    
    public void setVelocityX(final float n) {
        this.mMinValue = n;
        this.mMaxValue = n;
    }
    
    public void setVelocityX(final float mMinValue, final float mMaxValue) {
        this.mMinValue = mMinValue;
        this.mMaxValue = mMaxValue;
    }
    
    public void setVelocityY(final float n) {
        this.mMinValueB = n;
        this.mMaxValueB = n;
    }
    
    public void setVelocityY(final float mMinValueB, final float mMaxValueB) {
        this.mMinValueB = mMinValueB;
        this.mMaxValueB = mMaxValueB;
    }
}
