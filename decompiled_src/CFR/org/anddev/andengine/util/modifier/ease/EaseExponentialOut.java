/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseExponentialOut
implements IEaseFunction {
    private static EaseExponentialOut INSTANCE;

    private EaseExponentialOut() {
    }

    public static EaseExponentialOut getInstance() {
        if (EaseExponentialOut.INSTANCE != null) return EaseExponentialOut.INSTANCE;
        EaseExponentialOut.INSTANCE = new EaseExponentialOut();
        return EaseExponentialOut.INSTANCE;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        double d = f == f2 ? (double)(f3 + f4) : (double)f4 * (1.0 + - Math.pow(2.0, -10.0f * f / f2)) + (double)f3;
        return (float)d;
    }
}

