/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.IParticleInitializer;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseSingleValueInitializer
implements IParticleInitializer {
    protected float mMaxValue;
    protected float mMinValue;

    public BaseSingleValueInitializer(float f, float f2) {
        this.mMinValue = f;
        this.mMaxValue = f2;
    }

    private final float getRandomValue() {
        if (this.mMinValue != this.mMaxValue) return MathUtils.RANDOM.nextFloat() * (this.mMaxValue - this.mMinValue) + this.mMinValue;
        return this.mMaxValue;
    }

    @Override
    public void onInitializeParticle(Particle particle) {
        this.onInitializeParticle(particle, this.getRandomValue());
    }

    protected abstract void onInitializeParticle(Particle var1, float var2);
}

