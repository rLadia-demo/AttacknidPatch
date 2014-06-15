/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseSingleValueInitializer;

public class RotationInitializer
extends BaseSingleValueInitializer {
    public RotationInitializer(float f) {
        this(f, f);
    }

    public RotationInitializer(float f, float f2) {
        super(f, f2);
    }

    public float getMaxRotation() {
        return this.mMaxValue;
    }

    public float getMinRotation() {
        return this.mMinValue;
    }

    @Override
    public void onInitializeParticle(Particle particle, float f) {
        particle.setRotation(f);
    }

    public void setRotation(float f) {
        this.mMinValue = f;
        this.mMaxValue = f;
    }

    public void setRotation(float f, float f2) {
        this.mMinValue = f;
        this.mMaxValue = f2;
    }
}

