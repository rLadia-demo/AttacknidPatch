/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuartIn
implements IEaseFunction {
    private static EaseQuartIn INSTANCE;

    private EaseQuartIn() {
    }

    public static EaseQuartIn getInstance() {
        if (EaseQuartIn.INSTANCE != null) return EaseQuartIn.INSTANCE;
        EaseQuartIn.INSTANCE = new EaseQuartIn();
        return EaseQuartIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f5 * f5 * f4 * f5;
    }
}

