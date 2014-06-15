/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuadInOut
implements IEaseFunction {
    private static EaseQuadInOut INSTANCE;

    private EaseQuadInOut() {
    }

    public static EaseQuadInOut getInstance() {
        if (EaseQuadInOut.INSTANCE != null) return EaseQuadInOut.INSTANCE;
        EaseQuadInOut.INSTANCE = new EaseQuadInOut();
        return EaseQuadInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 * 0.5f;
        if (f5 < 1.0f) {
            return f3 + f5 * f5 * f4 * 0.5f;
        }
        float f6 = 0.5f * (- f4);
        float f7 = f5 - 1.0f;
        return f3 + f6 * (f7 * (f7 - 2.0f) - 1.0f);
    }
}

