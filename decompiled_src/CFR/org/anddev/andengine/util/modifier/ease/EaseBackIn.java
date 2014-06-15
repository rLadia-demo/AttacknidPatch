/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBackIn
implements IEaseFunction {
    private static EaseBackIn INSTANCE;

    private EaseBackIn() {
    }

    public static EaseBackIn getInstance() {
        if (EaseBackIn.INSTANCE != null) return EaseBackIn.INSTANCE;
        EaseBackIn.INSTANCE = new EaseBackIn();
        return EaseBackIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f4 * f5 * (2.70158f * f5 - 1.70158f);
    }
}

