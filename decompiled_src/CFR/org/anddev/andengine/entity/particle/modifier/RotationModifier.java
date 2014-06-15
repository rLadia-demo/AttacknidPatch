/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseSingleValueSpanModifier;

public class RotationModifier
extends BaseSingleValueSpanModifier {
    public RotationModifier(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    @Override
    protected void onSetInitialValue(Particle particle, float f) {
        particle.setRotation(f);
    }

    @Override
    protected void onSetValue(Particle particle, float f) {
        particle.setRotation(f);
    }
}

