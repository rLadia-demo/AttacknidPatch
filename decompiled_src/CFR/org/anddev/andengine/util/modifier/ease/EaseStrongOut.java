/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseStrongOut
implements IEaseFunction {
    private static EaseStrongOut INSTANCE;

    private EaseStrongOut() {
    }

    public static EaseStrongOut getInstance() {
        if (EaseStrongOut.INSTANCE != null) return EaseStrongOut.INSTANCE;
        EaseStrongOut.INSTANCE = new EaseStrongOut();
        return EaseStrongOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 - 1.0f;
        return f3 + f4 * (1.0f + f5 * f5 * f5 * f5 * f5);
    }
}

