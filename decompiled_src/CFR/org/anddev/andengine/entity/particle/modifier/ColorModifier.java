/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseTripleValueSpanModifier;

public class ColorModifier
extends BaseTripleValueSpanModifier {
    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        super(f, f2, f3, f4, f5, f6, f7, f8);
    }

    @Override
    protected void onSetInitialValues(Particle particle, float f, float f2, float f3) {
        particle.setColor(f, f2, f3);
    }

    @Override
    protected void onSetValues(Particle particle, float f, float f2, float f3) {
        particle.setColor(f, f2, f3);
    }
}

