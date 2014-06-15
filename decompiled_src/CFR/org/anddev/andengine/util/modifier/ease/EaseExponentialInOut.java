/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseExponentialInOut
implements IEaseFunction {
    private static EaseExponentialInOut INSTANCE;

    private EaseExponentialInOut() {
    }

    public static EaseExponentialInOut getInstance() {
        if (EaseExponentialInOut.INSTANCE != null) return EaseExponentialInOut.INSTANCE;
        EaseExponentialInOut.INSTANCE = new EaseExponentialInOut();
        return EaseExponentialInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5;
        if (f == 0.0f) {
            return f3;
        }
        if (f == f2) {
            return f3 + f4;
        }
        if ((f5 = f / f2 * 0.5f) >= 1.0f) return (float)((double)(f4 * 0.5f) * (2.0 + - Math.pow(2.0, -10.0f * (f5 - 1.0f))) + (double)f3);
        return (float)((double)(f4 * 0.5f) * Math.pow(2.0, 10.0f * (f5 - 1.0f)) + (double)f3);
    }
}

