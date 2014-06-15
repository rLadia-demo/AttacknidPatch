/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.constants.MathConstants;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseElasticInOut
implements IEaseFunction,
MathConstants {
    private static EaseElasticInOut INSTANCE;

    private EaseElasticInOut() {
    }

    public static EaseElasticInOut getInstance() {
        if (EaseElasticInOut.INSTANCE != null) return EaseElasticInOut.INSTANCE;
        EaseElasticInOut.INSTANCE = new EaseElasticInOut();
        return EaseElasticInOut.INSTANCE;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5;
        float f6;
        float f7;
        if (f == 0.0f) {
            return f3;
        }
        if ((f5 = (float)((double)f / 0.5 * (double)f2)) == 2.0f) {
            return f3 + f4;
        }
        float f8 = 0.0f FCMPL 0.0f;
        float f9 = 0.0f;
        if (f8 == false) {
            f9 = f2 * 0.45000002f;
        }
        if (0.0f == 0.0f || f4 > 0.0f && 0.0f < f4 || f4 < 0.0f && 0.0f < - f4) {
            f7 = f4;
            f6 = f9 / 4.0f;
        } else {
            f6 = (float)((double)(f9 / 6.2831855f) * Math.asin(f4 / 0.0f));
            f7 = 0.0f;
        }
        if (f5 < 1.0f) {
            double d = f7;
            float f10 = f5 - 1.0f;
            return (float)(-0.5 * d * Math.pow(2.0, 10.0f * f10) * (double)FloatMath.sin((float)(6.2831855f * (f10 * f2 - f6) / f9)) + (double)f3);
        }
        double d = f7;
        float f11 = f5 - 1.0f;
        return (float)(0.5 * d * Math.pow(2.0, -10.0f * f11) * (double)FloatMath.sin((float)(6.2831855f * (f11 * f2 - f6) / f9)) + (double)f4 + (double)f3);
    }
}

