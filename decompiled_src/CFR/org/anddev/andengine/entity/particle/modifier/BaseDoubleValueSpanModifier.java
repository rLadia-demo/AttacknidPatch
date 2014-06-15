/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseSingleValueSpanModifier;

public abstract class BaseDoubleValueSpanModifier
extends BaseSingleValueSpanModifier {
    private final float mFromValueB;
    private final float mSpanValueB;
    private final float mToValueB;

    public BaseDoubleValueSpanModifier(float f, float f2, float f3, float f4, float f5, float f6) {
        super(f, f2, f5, f6);
        this.mFromValueB = f3;
        this.mToValueB = f4;
        this.mSpanValueB = this.mToValueB - this.mFromValueB;
    }

    protected final float calculateValueB(float f) {
        return this.mFromValueB + f * this.mSpanValueB;
    }

    @Override
    public void onSetInitialValue(Particle particle, float f) {
        this.onSetInitialValues(particle, f, this.mFromValueB);
    }

    protected abstract void onSetInitialValues(Particle var1, float var2, float var3);

    @Deprecated
    @Override
    protected void onSetValue(Particle particle2, float particle2) {
    }

    @Override
    protected void onSetValueInternal(Particle particle, float f) {
        this.onSetValues(particle, super.calculateValue(f), this.calculateValueB(f));
    }

    protected abstract void onSetValues(Particle var1, float var2, float var3);
}

