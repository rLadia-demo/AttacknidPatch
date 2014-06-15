/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseDoubleValueSpanModifier;

public abstract class BaseTripleValueSpanModifier
extends BaseDoubleValueSpanModifier {
    private final float mFromValueC;
    private final float mSpanValueC;
    private final float mToValueC;

    public BaseTripleValueSpanModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        super(f, f2, f3, f4, f7, f8);
        this.mFromValueC = f5;
        this.mToValueC = f6;
        this.mSpanValueC = this.mToValueC - this.mFromValueC;
    }

    private final float calculateValueC(float f) {
        return this.mFromValueC + f * this.mSpanValueC;
    }

    @Override
    public void onSetInitialValues(Particle particle, float f, float f2) {
        this.onSetInitialValues(particle, f, f2, this.mFromValueC);
    }

    protected abstract void onSetInitialValues(Particle var1, float var2, float var3, float var4);

    @Override
    protected void onSetValueInternal(Particle particle, float f) {
        this.onSetValues(particle, super.calculateValue(f), super.calculateValueB(f), this.calculateValueC(f));
    }

    @Deprecated
    @Override
    protected void onSetValues(Particle particle22, float particle22, float particle22) {
    }

    protected abstract void onSetValues(Particle var1, float var2, float var3, float var4);
}

