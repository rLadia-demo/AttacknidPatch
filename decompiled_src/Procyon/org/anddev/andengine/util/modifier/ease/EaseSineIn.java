package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.constants.*;
import android.util.*;

public class EaseSineIn implements IEaseFunction, MathConstants
{
    private static EaseSineIn INSTANCE;
    
    public static EaseSineIn getInstance() {
        if (EaseSineIn.INSTANCE == null) {
            EaseSineIn.INSTANCE = new EaseSineIn();
        }
        return EaseSineIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        return n3 + (n4 + -n4 * FloatMath.cos(1.5707964f * (n / n2)));
    }
}
