/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.IParticleInitializer;

public interface IParticleModifier
extends IParticleInitializer {
    public void onUpdateParticle(Particle var1);
}

