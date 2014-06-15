/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseDoubleValueInitializer;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseTripleValueInitializer
extends BaseDoubleValueInitializer {
    protected float mMaxValueC;
    protected float mMinValueC;

    public BaseTripleValueInitializer(float f, float f2, float f3, float f4, float f5, float f6) {
        super(f, f2, f3, f4);
        this.mMinValueC = f5;
        this.mMaxValueC = f6;
    }

    private final float getRandomValueC() {
        if (this.mMinValueC != this.mMaxValueC) return MathUtils.RANDOM.nextFloat() * (this.mMaxValueC - this.mMinValueC) + this.mMinValueC;
        return this.mMaxValueC;
    }

    @Override
    protected void onInitializeParticle(Particle particle, float f, float f2) {
        this.onInitializeParticle(particle, f, f2, this.getRandomValueC());
    }

    protected abstract void onInitializeParticle(Particle var1, float var2, float var3, float var4);
}

