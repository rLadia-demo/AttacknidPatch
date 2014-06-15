/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBounceOut
implements IEaseFunction {
    private static EaseBounceOut INSTANCE;

    private EaseBounceOut() {
    }

    public static EaseBounceOut getInstance() {
        if (EaseBounceOut.INSTANCE != null) return EaseBounceOut.INSTANCE;
        EaseBounceOut.INSTANCE = new EaseBounceOut();
        return EaseBounceOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        if ((double)f5 < 0.36363636363636365) {
            return f3 + f4 * f5 * 7.5625f * f5;
        }
        if ((double)f5 < 0.7272727272727273) {
            float f6 = f5 - 0.54545456f;
            return f3 + f4 * (0.75f + f6 * 7.5625f * f6);
        }
        if ((double)f5 < 0.9090909090909091) {
            float f7 = f5 - 0.8181818f;
            return f3 + f4 * (0.9375f + f7 * 7.5625f * f7);
        }
        float f8 = f5 - 0.95454544f;
        return f3 + f4 * (0.984375f + f8 * 7.5625f * f8);
    }
}

