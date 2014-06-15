/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.IParticleModifier;

public abstract class BaseSingleValueSpanModifier
implements IParticleModifier {
    private final float mDuration;
    private final float mFromTime;
    private final float mFromValue;
    private final float mSpanValue;
    private final float mToTime;
    private final float mToValue;

    public BaseSingleValueSpanModifier(float f, float f2, float f3, float f4) {
        this.mFromValue = f;
        this.mToValue = f2;
        this.mFromTime = f3;
        this.mToTime = f4;
        this.mSpanValue = this.mToValue - this.mFromValue;
        this.mDuration = this.mToTime - this.mFromTime;
    }

    protected final float calculateValue(float f) {
        return this.mFromValue + f * this.mSpanValue;
    }

    @Override
    public void onInitializeParticle(Particle particle) {
        this.onSetInitialValue(particle, this.mFromValue);
    }

    protected abstract void onSetInitialValue(Particle var1, float var2);

    protected abstract void onSetValue(Particle var1, float var2);

    protected void onSetValueInternal(Particle particle, float f) {
        this.onSetValue(particle, this.calculateValue(f));
    }

    @Override
    public void onUpdateParticle(Particle particle) {
        float f = particle.getLifeTime();
        if (f <= this.mFromTime || f >= this.mToTime) return;
        this.onSetValueInternal(particle, (f - this.mFromTime) / this.mDuration);
    }
}

