package org.anddev.andengine.util.modifier.ease;

import android.util.*;

public class EaseCircularIn implements IEaseFunction
{
    private static EaseCircularIn INSTANCE;
    
    public static EaseCircularIn getInstance() {
        if (EaseCircularIn.INSTANCE == null) {
            EaseCircularIn.INSTANCE = new EaseCircularIn();
        }
        return EaseCircularIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = -n4;
        final float n6 = n / n2;
        return n3 + n5 * (FloatMath.sqrt(1.0f - n6 * n6) - 1.0f);
    }
}
