/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseStrongInOut
implements IEaseFunction {
    private static EaseStrongInOut INSTANCE;

    private EaseStrongInOut() {
    }

    public static EaseStrongInOut getInstance() {
        if (EaseStrongInOut.INSTANCE != null) return EaseStrongInOut.INSTANCE;
        EaseStrongInOut.INSTANCE = new EaseStrongInOut();
        return EaseStrongInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 * 0.5f;
        if (f5 < 1.0f) {
            return f3 + f5 * f5 * f5 * f5 * f5 * f4 * 0.5f;
        }
        float f6 = f4 * 0.5f;
        float f7 = f5 - 2.0f;
        return f3 + f6 * (2.0f + f7 * f7 * f7 * f7 * f7);
    }
}

