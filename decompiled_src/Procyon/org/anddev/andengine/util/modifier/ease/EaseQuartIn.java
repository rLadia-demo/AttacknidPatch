package org.anddev.andengine.util.modifier.ease;

public class EaseQuartIn implements IEaseFunction
{
    private static EaseQuartIn INSTANCE;
    
    public static EaseQuartIn getInstance() {
        if (EaseQuartIn.INSTANCE == null) {
            EaseQuartIn.INSTANCE = new EaseQuartIn();
        }
        return EaseQuartIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n5 * (n5 * (n4 * n5)));
    }
}
