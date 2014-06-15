/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuartOut
implements IEaseFunction {
    private static EaseQuartOut INSTANCE;

    private EaseQuartOut() {
    }

    public static EaseQuartOut getInstance() {
        if (EaseQuartOut.INSTANCE != null) return EaseQuartOut.INSTANCE;
        EaseQuartOut.INSTANCE = new EaseQuartOut();
        return EaseQuartOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = - f4;
        float f6 = f / f2 - 1.0f;
        return f3 + f5 * (f6 * f6 * f6 * f6 - 1.0f);
    }
}

