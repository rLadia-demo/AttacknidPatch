package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialInOut implements IEaseFunction
{
    private static EaseExponentialInOut INSTANCE;
    
    public static EaseExponentialInOut getInstance() {
        if (EaseExponentialInOut.INSTANCE == null) {
            EaseExponentialInOut.INSTANCE = new EaseExponentialInOut();
        }
        return EaseExponentialInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        if (n == 0.0f) {
            return n3;
        }
        if (n == n2) {
            return n3 + n4;
        }
        final float n5 = n / (n2 * 0.5f);
        if (n5 < 1.0f) {
            return (float)(n4 * 0.5f * Math.pow(2.0, 10.0f * (n5 - 1.0f)) + n3);
        }
        return (float)(n4 * 0.5f * (2.0 + -Math.pow(2.0, -10.0f * (n5 - 1.0f))) + n3);
    }
}
