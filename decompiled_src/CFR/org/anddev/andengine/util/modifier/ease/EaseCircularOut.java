/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseCircularOut
implements IEaseFunction {
    private static EaseCircularOut INSTANCE;

    private EaseCircularOut() {
    }

    public static EaseCircularOut getInstance() {
        if (EaseCircularOut.INSTANCE != null) return EaseCircularOut.INSTANCE;
        EaseCircularOut.INSTANCE = new EaseCircularOut();
        return EaseCircularOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = f / f2 - 1.0f;
        return f3 + f4 * FloatMath.sqrt((float)(1.0f - f5 * f5));
    }
}

