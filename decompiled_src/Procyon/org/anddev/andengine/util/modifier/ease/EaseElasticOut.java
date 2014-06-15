package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.constants.*;
import android.util.*;

public class EaseElasticOut implements IEaseFunction, MathConstants
{
    private static EaseElasticOut INSTANCE;
    
    public static EaseElasticOut getInstance() {
        if (EaseElasticOut.INSTANCE == null) {
            EaseElasticOut.INSTANCE = new EaseElasticOut();
        }
        return EaseElasticOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        if (n == 0.0f) {
            return n3;
        }
        final float n5 = n / n2;
        if (n5 == 1.0f) {
            return n3 + n4;
        }
        final float n6 = fcmpl(0.0f, 0.0f);
        float n7 = 0.0f;
        if (n6 == 0) {
            n7 = n2 * 0.3f;
        }
        float n8;
        float n9;
        if (0.0f == 0.0f || (n4 > 0.0f && 0.0f < n4) || (n4 < 0.0f && 0.0f < -n4)) {
            n8 = n4;
            n9 = n7 / 4.0f;
        }
        else {
            n9 = (float)(n7 / 6.2831855f * Math.asin(n4 / 0.0f));
            n8 = 0.0f;
        }
        return (float)(n8 * Math.pow(2.0, -10.0f * n5) * FloatMath.sin(6.2831855f * (n5 * n2 - n9) / n7) + n4 + n3);
    }
}
