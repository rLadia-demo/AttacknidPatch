/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseQuintIn
implements IEaseFunction {
    private static EaseQuintIn INSTANCE;

    private EaseQuintIn() {
    }

    public static EaseQuintIn getInstance() {
        if (EaseQuintIn.INSTANCE != null) return EaseQuintIn.INSTANCE;
        EaseQuintIn.INSTANCE = new EaseQuintIn();
        return EaseQuintIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f5 * f5 * f5 * f4 * f5;
    }
}

