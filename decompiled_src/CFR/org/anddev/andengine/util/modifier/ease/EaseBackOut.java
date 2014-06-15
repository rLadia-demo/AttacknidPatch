/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBackOut
implements IEaseFunction {
    private static EaseBackOut INSTANCE;

    private EaseBackOut() {
    }

    public static EaseBackOut getInstance() {
        if (EaseBackOut.INSTANCE != null) return EaseBackOut.INSTANCE;
        EaseBackOut.INSTANCE = new EaseBackOut();
        return EaseBackOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 - 1.0f;
        return f3 + f4 * (1.0f + f5 * f5 * (1.70158f + 2.70158f * f5));
    }
}

