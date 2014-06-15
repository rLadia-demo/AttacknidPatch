/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuintOut
implements IEaseFunction {
    private static EaseQuintOut INSTANCE;

    private EaseQuintOut() {
    }

    public static EaseQuintOut getInstance() {
        if (EaseQuintOut.INSTANCE != null) return EaseQuintOut.INSTANCE;
        EaseQuintOut.INSTANCE = new EaseQuintOut();
        return EaseQuintOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 - 1.0f;
        return f3 + f4 * (1.0f + f5 * f5 * f5 * f5 * f5);
    }
}

