package org.anddev.andengine.util.modifier.ease;

public class EaseQuartOut implements IEaseFunction
{
    private static EaseQuartOut INSTANCE;
    
    public static EaseQuartOut getInstance() {
        if (EaseQuartOut.INSTANCE == null) {
            EaseQuartOut.INSTANCE = new EaseQuartOut();
        }
        return EaseQuartOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = -n4;
        final float n6 = n / n2 - 1.0f;
        return n3 + n5 * (n6 * (n6 * (n6 * n6)) - 1.0f);
    }
}
