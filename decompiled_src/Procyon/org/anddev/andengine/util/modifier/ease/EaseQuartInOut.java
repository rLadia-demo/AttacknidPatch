package org.anddev.andengine.util.modifier.ease;

public class EaseQuartInOut implements IEaseFunction
{
    private static EaseQuartInOut INSTANCE;
    
    public static EaseQuartInOut getInstance() {
        if (EaseQuartInOut.INSTANCE == null) {
            EaseQuartInOut.INSTANCE = new EaseQuartInOut();
        }
        return EaseQuartInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / (n2 * 0.5f);
        if (n5 < 1.0f) {
            return n3 + n5 * (n5 * (n5 * (n5 * (n4 * 0.5f))));
        }
        final float n6 = 0.5f * -n4;
        final float n7 = n5 - 2.0f;
        return n3 + n6 * (n7 * (n7 * (n7 * n7)) - 2.0f);
    }
}
