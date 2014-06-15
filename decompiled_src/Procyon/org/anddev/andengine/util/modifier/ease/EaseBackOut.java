package org.anddev.andengine.util.modifier.ease;

public class EaseBackOut implements IEaseFunction
{
    private static EaseBackOut INSTANCE;
    
    public static EaseBackOut getInstance() {
        if (EaseBackOut.INSTANCE == null) {
            EaseBackOut.INSTANCE = new EaseBackOut();
        }
        return EaseBackOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2 - 1.0f;
        return n3 + n4 * (1.0f + n5 * n5 * (1.70158f + 2.70158f * n5));
    }
}
