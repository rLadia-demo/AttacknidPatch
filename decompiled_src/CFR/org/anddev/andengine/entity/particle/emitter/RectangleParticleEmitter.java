/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import java.util.Random;
import org.anddev.andengine.entity.particle.emitter.BaseRectangleParticleEmitter;
import org.anddev.andengine.util.MathUtils;

public class RectangleParticleEmitter
extends BaseRectangleParticleEmitter {
    public RectangleParticleEmitter(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    @Override
    public void getPositionOffset(float[] arrf) {
        arrf[0] = this.mCenterX - this.mWidthHalf + MathUtils.RANDOM.nextFloat() * this.mWidth;
        arrf[1] = this.mCenterY - this.mHeightHalf + MathUtils.RANDOM.nextFloat() * this.mHeight;
    }
}

