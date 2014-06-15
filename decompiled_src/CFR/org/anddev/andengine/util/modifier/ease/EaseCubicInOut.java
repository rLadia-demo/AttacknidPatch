/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseCubicInOut
implements IEaseFunction {
    private static EaseCubicInOut INSTANCE;

    private EaseCubicInOut() {
    }

    public static EaseCubicInOut getInstance() {
        if (EaseCubicInOut.INSTANCE != null) return EaseCubicInOut.INSTANCE;
        EaseCubicInOut.INSTANCE = new EaseCubicInOut();
        return EaseCubicInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 * 0.5f;
        if (f5 < 1.0f) {
            return f3 + f5 * f5 * f5 * f4 * 0.5f;
        }
        float f6 = f4 * 0.5f;
        float f7 = f5 - 2.0f;
        return f3 + f6 * (2.0f + f7 * f7 * f7);
    }
}

