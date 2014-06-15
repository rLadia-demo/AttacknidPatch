/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.EaseBounceOut;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBounceIn
implements IEaseFunction {
    private static EaseBounceIn INSTANCE;

    private EaseBounceIn() {
    }

    public static EaseBounceIn getInstance() {
        if (EaseBounceIn.INSTANCE != null) return EaseBounceIn.INSTANCE;
        EaseBounceIn.INSTANCE = new EaseBounceIn();
        return EaseBounceIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        return f3 + f4 - EaseBounceOut.getInstance().getPercentageDone(f2 - f, f2, 0.0f, f4);
    }
}

