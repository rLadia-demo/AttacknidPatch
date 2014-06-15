/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.constants.MathConstants;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class EaseSineIn
implements IEaseFunction,
MathConstants {
    private static EaseSineIn INSTANCE;

    private EaseSineIn() {
    }

    public static EaseSineIn getInstance() {
        if (EaseSineIn.INSTANCE != null) return EaseSineIn.INSTANCE;
        EaseSineIn.INSTANCE = new EaseSineIn();
        return EaseSineIn.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        return f3 + f4 + (- f4) * FloatMath.cos((float)(1.5707964f * f / f2));
    }
}

