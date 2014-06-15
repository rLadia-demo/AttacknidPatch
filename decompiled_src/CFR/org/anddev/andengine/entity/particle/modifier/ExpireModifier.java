/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.IParticleModifier;
import org.anddev.andengine.util.MathUtils;

public class ExpireModifier
implements IParticleModifier {
    private float mMaxLifeTime;
    private float mMinLifeTime;

    public ExpireModifier(float f) {
        this(f, f);
    }

    public ExpireModifier(float f, float f2) {
        this.mMinLifeTime = f;
        this.mMaxLifeTime = f2;
    }

    public float getMaxLifeTime() {
        return this.mMaxLifeTime;
    }

    public float getMinLifeTime() {
        return this.mMinLifeTime;
    }

    @Override
    public void onInitializeParticle(Particle particle) {
        particle.setDeathTime(MathUtils.RANDOM.nextFloat() * (this.mMaxLifeTime - this.mMinLifeTime) + this.mMinLifeTime);
    }

    @Override
    public void onUpdateParticle(Particle particle) {
    }

    public void setLifeTime(float f) {
        this.mMinLifeTime = f;
        this.mMaxLifeTime = f;
    }

    public void setLifeTime(float f, float f2) {
        this.mMinLifeTime = f;
        this.mMaxLifeTime = f2;
    }
}

