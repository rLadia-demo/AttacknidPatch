/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.entity.particle.emitter;

import android.util.FloatMath;
import java.util.Random;
import org.anddev.andengine.entity.particle.emitter.BaseCircleParticleEmitter;
import org.anddev.andengine.util.MathUtils;

public class CircleOutlineParticleEmitter
extends BaseCircleParticleEmitter {
    public CircleOutlineParticleEmitter(float f, float f2, float f3) {
        super(f, f2, f3);
    }

    public CircleOutlineParticleEmitter(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    @Override
    public void getPositionOffset(float[] arrf) {
        float f = 2.0f * 3.1415927f * MathUtils.RANDOM.nextFloat();
        arrf[0] = this.mCenterX + FloatMath.cos((float)f) * this.mRadiusX;
        arrf[1] = this.mCenterY + FloatMath.sin((float)f) * this.mRadiusY;
    }
}

