/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseStrongIn
implements IEaseFunction {
    private static EaseStrongIn INSTANCE;

    private EaseStrongIn() {
    }

    public static EaseStrongIn getInstance() {
        if (EaseStrongIn.INSTANCE != null) return EaseStrongIn.INSTANCE;
        EaseStrongIn.INSTANCE = new EaseStrongIn();
        return EaseStrongIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f5 * f5 * f5 * f4 * f5;
    }
}

