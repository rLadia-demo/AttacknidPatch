/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseCubicIn
implements IEaseFunction {
    private static EaseCubicIn INSTANCE;

    private EaseCubicIn() {
    }

    public static EaseCubicIn getInstance() {
        if (EaseCubicIn.INSTANCE != null) return EaseCubicIn.INSTANCE;
        EaseCubicIn.INSTANCE = new EaseCubicIn();
        return EaseCubicIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2;
        return f3 + f5 * f5 * f4 * f5;
    }
}

