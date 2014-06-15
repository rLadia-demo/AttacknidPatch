/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuadOut
implements IEaseFunction {
    private static EaseQuadOut INSTANCE;

    private EaseQuadOut() {
    }

    public static EaseQuadOut getInstance() {
        if (EaseQuadOut.INSTANCE != null) return EaseQuadOut.INSTANCE;
        EaseQuadOut.INSTANCE = new EaseQuadOut();
        return EaseQuadOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = - f4;
        float f6 = f / f2;
        return f3 + f5 * f6 * (f6 - 2.0f);
    }
}

