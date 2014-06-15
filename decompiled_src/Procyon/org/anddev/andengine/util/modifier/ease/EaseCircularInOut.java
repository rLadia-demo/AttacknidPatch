package org.anddev.andengine.util.modifier.ease;

import android.util.*;

public class EaseCircularInOut implements IEaseFunction
{
    private static EaseCircularInOut INSTANCE;
    
    public static EaseCircularInOut getInstance() {
        if (EaseCircularInOut.INSTANCE == null) {
            EaseCircularInOut.INSTANCE = new EaseCircularInOut();
        }
        return EaseCircularInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = (float)(n / (0.5 * n2));
        if (n5 < 1.0f) {
            return (float)(0.5 * -n4 * (FloatMath.sqrt(1.0f - n5 * n5) - 1.0f) + n3);
        }
        final double n6 = 0.5 * n4;
        final float n7 = n5 - 2.0f;
        return (float)(n6 * (1.0f + FloatMath.sqrt(1.0f - n7 * n7)) + n3);
    }
}
