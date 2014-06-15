/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBackInOut
implements IEaseFunction {
    private static EaseBackInOut INSTANCE;

    private EaseBackInOut() {
    }

    public static EaseBackInOut getInstance() {
        if (EaseBackInOut.INSTANCE != null) return EaseBackInOut.INSTANCE;
        EaseBackInOut.INSTANCE = new EaseBackInOut();
        return EaseBackInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 * 0.5f;
        if (f5 < 1.0f) {
            float f6 = f4 * 0.5f;
            float f7 = f5 * f5;
            float f8 = 1.70158f * 1.525f;
            return f3 + f6 * f7 * (f5 * (1.0f + f8) - f8);
        }
        float f9 = f4 / 2.0f;
        float f10 = f5 - 2.0f;
        float f11 = f10 * f10;
        float f12 = 1.70158f * 1.525f;
        return f3 + f9 * (2.0f + f11 * (f12 + f10 * (1.0f + f12)));
    }
}

