package org.anddev.andengine.util.modifier.ease;

public class EaseQuadIn implements IEaseFunction
{
    private static EaseQuadIn INSTANCE;
    
    public static EaseQuadIn getInstance() {
        if (EaseQuadIn.INSTANCE == null) {
            EaseQuadIn.INSTANCE = new EaseQuadIn();
        }
        return EaseQuadIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n4 * n5);
    }
}
