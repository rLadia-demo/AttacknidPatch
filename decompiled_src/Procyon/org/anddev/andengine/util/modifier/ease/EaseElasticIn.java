package org.anddev.andengine.util.modifier.ease;

import org.anddev.andengine.util.constants.*;
import android.util.*;

public class EaseElasticIn implements IEaseFunction, MathConstants
{
    private static EaseElasticIn INSTANCE;
    
    public static EaseElasticIn getInstance() {
        if (EaseElasticIn.INSTANCE == null) {
            EaseElasticIn.INSTANCE = new EaseElasticIn();
        }
        return EaseElasticIn.INSTANCE;
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
        final double n10 = n8;
        final float n11 = n5 - 1.0f;
        return (float)(-(n10 * Math.pow(2.0, 10.0f * n11) * FloatMath.sin(6.2831855f * (n11 * n2 - n9) / n7)) + n3);
    }
}
