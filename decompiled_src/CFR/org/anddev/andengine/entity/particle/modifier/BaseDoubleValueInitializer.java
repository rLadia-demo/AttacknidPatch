/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseSingleValueInitializer;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseDoubleValueInitializer
extends BaseSingleValueInitializer {
    protected float mMaxValueB;
    protected float mMinValueB;

    public BaseDoubleValueInitializer(float f, float f2, float f3, float f4) {
        super(f, f2);
        this.mMinValueB = f3;
        this.mMaxValueB = f4;
    }

    private final float getRandomValueB() {
        if (this.mMinValueB != this.mMaxValueB) return MathUtils.RANDOM.nextFloat() * (this.mMaxValueB - this.mMinValueB) + this.mMinValueB;
        return this.mMaxValueB;
    }

    @Override
    protected void onInitializeParticle(Particle particle, float f) {
        this.onInitializeParticle(particle, f, this.getRandomValueB());
    }

    protected abstract void onInitializeParticle(Particle var1, float var2, float var3);
}

