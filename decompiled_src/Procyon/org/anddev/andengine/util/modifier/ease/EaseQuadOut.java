package org.anddev.andengine.util.modifier.ease;

public class EaseQuadOut implements IEaseFunction
{
    private static EaseQuadOut INSTANCE;
    
    public static EaseQuadOut getInstance() {
        if (EaseQuadOut.INSTANCE == null) {
            EaseQuadOut.INSTANCE = new EaseQuadOut();
        }
        return EaseQuadOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = -n4;
        final float n6 = n / n2;
        return n3 + n5 * n6 * (n6 - 2.0f);
    }
}
