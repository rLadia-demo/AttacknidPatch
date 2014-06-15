package org.anddev.andengine.util.modifier.ease;

public class EaseQuintIn implements IEaseFunction
{
    private static EaseQuintIn INSTANCE;
    
    public static EaseQuintIn getInstance() {
        if (EaseQuintIn.INSTANCE == null) {
            EaseQuintIn.INSTANCE = new EaseQuintIn();
        }
        return EaseQuintIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n5 * (n5 * (n5 * (n4 * n5))));
    }
}
