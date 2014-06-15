/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseCircularInOut
implements IEaseFunction {
    private static EaseCircularInOut INSTANCE;

    private EaseCircularInOut() {
    }

    public static EaseCircularInOut getInstance() {
        if (EaseCircularInOut.INSTANCE != null) return EaseCircularInOut.INSTANCE;
        EaseCircularInOut.INSTANCE = new EaseCircularInOut();
        return EaseCircularInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = (float)((double)f / 0.5 * (double)f2);
        if (f5 < 1.0f) {
            return (float)(0.5 * (double)(- f4) * (double)(FloatMath.sqrt((float)(1.0f - f5 * f5)) - 1.0f) + (double)f3);
        }
        double d = 0.5 * (double)f4;
        float f6 = f5 - 2.0f;
        return (float)(d * (double)(1.0f + FloatMath.sqrt((float)(1.0f - f6 * f6))) + (double)f3);
    }
}

