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

public class EaseSineOut
implements IEaseFunction,
MathConstants {
    private static EaseSineOut INSTANCE;

    private EaseSineOut() {
    }

    public static EaseSineOut getInstance() {
        if (EaseSineOut.INSTANCE != null) return EaseSineOut.INSTANCE;
        EaseSineOut.INSTANCE = new EaseSineOut();
        return EaseSineOut.INSTANCE;
    }

    @Override
    public float getPercentageDone(float f, float f2, float f3, float f4) {
        return f3 + f4 * FloatMath.sin((float)(1.5707964f * f / f2));
    }
}

