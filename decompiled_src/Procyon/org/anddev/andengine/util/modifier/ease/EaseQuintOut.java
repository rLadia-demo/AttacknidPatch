package org.anddev.andengine.util.modifier.ease;

public class EaseQuintOut implements IEaseFunction
{
    private static EaseQuintOut INSTANCE;
    
    public static EaseQuintOut getInstance() {
        if (EaseQuintOut.INSTANCE == null) {
            EaseQuintOut.INSTANCE = new EaseQuintOut();
        }
        return EaseQuintOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2 - 1.0f;
        return n3 + n4 * (1.0f + n5 * (n5 * (n5 * (n5 * n5))));
    }
}
