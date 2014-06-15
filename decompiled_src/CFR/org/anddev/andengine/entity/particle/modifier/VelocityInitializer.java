/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseDoubleValueInitializer;

public class VelocityInitializer
extends BaseDoubleValueInitializer {
    public VelocityInitializer(float f) {
        this(f, f, f, f);
    }

    public VelocityInitializer(float f, float f2) {
        this(f, f, f2, f2);
    }

    public VelocityInitializer(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
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

    @Override
    public void onInitializeParticle(Particle particle, float f, float f2) {
        particle.setVelocity(f, f2);
    }

    public void setVelocity(float f, float f2, float f3, float f4) {
        this.mMinValue = f;
        this.mMaxValue = f2;
        this.mMinValueB = f3;
        this.mMaxValueB = f4;
    }

    public void setVelocityX(float f) {
        this.mMinValue = f;
        this.mMaxValue = f;
    }

    public void setVelocityX(float f, float f2) {
        this.mMinValue = f;
        this.mMaxValue = f2;
    }

    public void setVelocityY(float f) {
        this.mMinValueB = f;
        this.mMaxValueB = f;
    }

    public void setVelocityY(float f, float f2) {
        this.mMinValueB = f;
        this.mMaxValueB = f2;
    }
}

