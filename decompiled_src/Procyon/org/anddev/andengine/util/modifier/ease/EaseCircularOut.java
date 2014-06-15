package org.anddev.andengine.util.modifier.ease;

import android.util.*;

public class EaseCircularOut implements IEaseFunction
{
    private static EaseCircularOut INSTANCE;
    
    public static EaseCircularOut getInstance() {
        if (EaseCircularOut.INSTANCE == null) {
            EaseCircularOut.INSTANCE = new EaseCircularOut();
        }
        return EaseCircularOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2 - 1.0f;
        return n3 + n4 * FloatMath.sqrt(1.0f - n5 * n5);
    }
}
