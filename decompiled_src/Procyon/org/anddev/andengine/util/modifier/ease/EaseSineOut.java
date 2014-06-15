package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.constants.*;
import android.util.*;

public class EaseSineOut implements IEaseFunction, MathConstants
{
    private static EaseSineOut INSTANCE;
    
    public static EaseSineOut getInstance() {
        if (EaseSineOut.INSTANCE == null) {
            EaseSineOut.INSTANCE = new EaseSineOut();
        }
        return EaseSineOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        return n3 + n4 * FloatMath.sin(1.5707964f * (n / n2));
    }
}
