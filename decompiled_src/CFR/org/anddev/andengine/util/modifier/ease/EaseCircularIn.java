/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseCircularIn
implements IEaseFunction {
    private static EaseCircularIn INSTANCE;

    private EaseCircularIn() {
    }

    public static EaseCircularIn getInstance() {
        if (EaseCircularIn.INSTANCE != null) return EaseCircularIn.INSTANCE;
        EaseCircularIn.INSTANCE = new EaseCircularIn();
        return EaseCircularIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        float f5 = - f4;
        float f6 = f / f2;
        return f3 + f5 * (FloatMath.sqrt((float)(1.0f - f6 * f6)) - 1.0f);
    }
}

