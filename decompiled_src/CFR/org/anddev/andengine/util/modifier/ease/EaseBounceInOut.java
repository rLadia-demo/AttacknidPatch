/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.modifier.ease.EaseBounceIn;
import org.anddev.andengine.util.modifier.ease.EaseBounceOut;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseBounceInOut
implements IEaseFunction {
    private static EaseBounceInOut INSTANCE;

    private EaseBounceInOut() {
    }

    public static EaseBounceInOut getInstance() {
        if (EaseBounceInOut.INSTANCE != null) return EaseBounceInOut.INSTANCE;
        EaseBounceInOut.INSTANCE = new EaseBounceInOut();
        return EaseBounceInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        if ((double)f >= 0.5 * (double)f2) return f3 + 0.5f * EaseBounceOut.getInstance().getPercentageDone(f * 2.0f - f2, f2, 0.0f, f4) + f4 * 0.5f;
        return f3 + 0.5f * EaseBounceIn.getInstance().getPercentageDone(f * 2.0f, f2, 0.0f, f4);
    }
}

