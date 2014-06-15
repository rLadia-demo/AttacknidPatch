/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.entity.particle.emitter.BaseRectangleParticleEmitter;
import org.anddev.andengine.util.MathUtils;

public class RectangleOutlineParticleEmitter
extends BaseRectangleParticleEmitter {
    public RectangleOutlineParticleEmitter(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    @Override
    public void getPositionOffset(float[] arrf) {
        arrf[0] = this.mCenterX + (float)MathUtils.randomSign() * this.mWidthHalf;
        arrf[1] = this.mCenterY + (float)MathUtils.randomSign() * this.mHeightHalf;
    }
}

