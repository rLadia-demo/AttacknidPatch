package org.anddev.andengine.util.modifier.ease;

import android.util.*;

public class EaseSineInOut implements IEaseFunction
{
    private static EaseSineInOut INSTANCE;
    
    public static EaseSineInOut getInstance() {
        if (EaseSineInOut.INSTANCE == null) {
            EaseSineInOut.INSTANCE = new EaseSineInOut();
        }
        return EaseSineInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        return n3 + 0.5f * -n4 * (FloatMath.cos(3.1415927f * n / n2) - 1.0f);
    }
}
