/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseExponentialIn
implements IEaseFunction {
    private static EaseExponentialIn INSTANCE;

    private EaseExponentialIn() {
    }

    public static EaseExponentialIn getInstance() {
        if (EaseExponentialIn.INSTANCE != null) return EaseExponentialIn.INSTANCE;
        EaseExponentialIn.INSTANCE = new EaseExponentialIn();
        return EaseExponentialIn.INSTANCE;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        double d = f == 0.0f ? (double)f3 : (double)f4 * Math.pow(2.0, 10.0f * (f / f2 - 1.0f)) + (double)f3 - (double)(0.001f * f4);
        return (float)d;
    }
}

