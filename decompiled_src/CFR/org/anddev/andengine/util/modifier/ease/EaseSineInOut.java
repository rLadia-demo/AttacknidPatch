/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseSineInOut
implements IEaseFunction {
    private static EaseSineInOut INSTANCE;

    private EaseSineInOut() {
    }

    public static EaseSineInOut getInstance() {
        if (EaseSineInOut.INSTANCE != null) return EaseSineInOut.INSTANCE;
        EaseSineInOut.INSTANCE = new EaseSineInOut();
        return EaseSineInOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        return f3 + 0.5f * (- f4) * (FloatMath.cos((float)(3.1415927f * f / f2)) - 1.0f);
    }
}

