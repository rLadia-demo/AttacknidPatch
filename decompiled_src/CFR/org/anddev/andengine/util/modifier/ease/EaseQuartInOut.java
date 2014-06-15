/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuartInOut
implements IEaseFunction {
    private static EaseQuartInOut INSTANCE;

    private EaseQuartInOut() {
    }

    public static EaseQuartInOut getInstance() {
        if (EaseQuartInOut.INSTANCE != null) return EaseQuartInOut.INSTANCE;
        EaseQuartInOut.INSTANCE = new EaseQuartInOut();
        return EaseQuartInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 * 0.5f;
        if (f5 < 1.0f) {
            return f3 + f5 * f5 * f5 * f5 * f4 * 0.5f;
        }
        float f6 = 0.5f * (- f4);
        float f7 = f5 - 2.0f;
        return f3 + f6 * (f7 * f7 * f7 * f7 - 2.0f);
    }
}

