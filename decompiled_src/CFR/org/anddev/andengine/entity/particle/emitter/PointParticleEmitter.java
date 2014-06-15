/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.entity.particle.emitter.BaseParticleEmitter;

public class PointParticleEmitter
extends BaseParticleEmitter {
    public PointParticleEmitter(float f, float f2) {
        super(f, f2);
    }

    @Override
    public void getPositionOffset(float[] arrf) {
        arrf[0] = this.mCenterX;
        arrf[1] = this.mCenterY;
    }
}

