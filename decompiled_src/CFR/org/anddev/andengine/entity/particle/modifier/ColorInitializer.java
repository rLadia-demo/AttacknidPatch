/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseTripleValueInitializer;

public class ColorInitializer
extends BaseTripleValueInitializer {
    public ColorInitializer(float f, float f2, float f3) {
        super(f, f, f2, f2, f3, f3);
    }

    public ColorInitializer(float f, float f2, float f3, float f4, float f5, float f6) {
        super(f, f2, f3, f4, f5, f6);
    }

    @Override
    protected void onInitializeParticle(Particle particle, float f, float f2, float f3) {
        particle.setColor(f, f2, f3);
    }
}

