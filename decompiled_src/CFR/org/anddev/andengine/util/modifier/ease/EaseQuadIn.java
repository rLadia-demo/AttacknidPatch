/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuadIn
implements IEaseFunction {
    private static EaseQuadIn INSTANCE;

    private EaseQuadIn() {
    }

    public static EaseQuadIn getInstance() {
        if (EaseQuadIn.INSTANCE != null) return EaseQuadIn.INSTANCE;
        EaseQuadIn.INSTANCE = new EaseQuadIn();
        return EaseQuadIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f4 * f5;
    }
}

