/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseLinear
implements IEaseFunction {
    private static EaseLinear INSTANCE;

    private EaseLinear() {
    }

    public static EaseLinear getInstance() {
        if (EaseLinear.INSTANCE != null) return EaseLinear.INSTANCE;
        EaseLinear.INSTANCE = new EaseLinear();
        return EaseLinear.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        return f3 + f4 * f / f2;
    }
}

