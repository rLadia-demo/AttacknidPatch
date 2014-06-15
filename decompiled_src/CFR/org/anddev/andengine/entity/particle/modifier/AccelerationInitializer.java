/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseDoubleValueInitializer;

public class AccelerationInitializer
extends BaseDoubleValueInitializer {
    public AccelerationInitializer(float f) {
        this(f, f);
    }

    public AccelerationInitializer(float f, float f2) {
        this(f, f, f2, f2);
    }

    public AccelerationInitializer(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
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

    @Override
    public void onInitializeParticle(Particle particle, float f, float f2) {
        particle.accelerate(f, f2);
    }

    public void setAcceleration(float f, float f2, float f3, float f4) {
        this.mMinValue = f;
        this.mMaxValue = f2;
        this.mMinValueB = f3;
        this.mMaxValueB = f4;
    }

    public void setAccelerationX(float f) {
        this.mMinValue = f;
        this.mMaxValue = f;
    }

    public void setAccelerationX(float f, float f2) {
        this.mMinValue = f;
        this.mMaxValue = f2;
    }

    public void setAccelerationY(float f) {
        this.mMinValueB = f;
        this.mMaxValueB = f;
    }

    public void setAccelerationY(float f, float f2) {
        this.mMinValueB = f;
        this.mMaxValueB = f2;
    }
}

