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

public class EaseElasticOut
implements IEaseFunction,
MathConstants {
    private static EaseElasticOut INSTANCE;

    private EaseElasticOut() {
    }

    public static EaseElasticOut getInstance() {
        if (EaseElasticOut.INSTANCE != null) return EaseElasticOut.INSTANCE;
        EaseElasticOut.INSTANCE = new EaseElasticOut();
        return EaseElasticOut.INSTANCE;
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
        if ((f5 = f / f2) == 1.0f) {
            return f3 + f4;
        }
        float f8 = 0.0f FCMPL 0.0f;
        float f9 = 0.0f;
        if (f8 == false) {
            f9 = f2 * 0.3f;
        }
        if (0.0f == 0.0f || f4 > 0.0f && 0.0f < f4 || f4 < 0.0f && 0.0f < - f4) {
            f7 = f4;
            f6 = f9 / 4.0f;
            return (float)((double)f7 * Math.pow(2.0, -10.0f * f5) * (double)FloatMath.sin((float)(6.2831855f * (f5 * f2 - f6) / f9)) + (double)f4 + (double)f3);
        } else {
            f6 = (float)((double)(f9 / 6.2831855f) * Math.asin(f4 / 0.0f));
            f7 = 0.0f;
        }
        return (float)((double)f7 * Math.pow(2.0, -10.0f * f5) * (double)FloatMath.sin((float)(6.2831855f * (f5 * f2 - f6) / f9)) + (double)f4 + (double)f3);
    }
}

