/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.BaseSingleValueInitializer;

public class AlphaInitializer
extends BaseSingleValueInitializer {
    public AlphaInitializer(float f) {
        super(f, f);
    }

    public AlphaInitializer(float f, float f2) {
        super(f, f2);
    }

    @Override
    protected void onInitializeParticle(Particle particle, float f) {
        particle.setAlpha(f);
    }
}

