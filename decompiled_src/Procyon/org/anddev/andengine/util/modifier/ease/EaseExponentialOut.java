package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialOut implements IEaseFunction
{
    private static EaseExponentialOut INSTANCE;
    
    public static EaseExponentialOut getInstance() {
        if (EaseExponentialOut.INSTANCE == null) {
            EaseExponentialOut.INSTANCE = new EaseExponentialOut();
        }
        return EaseExponentialOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        double n5;
        if (n == n2) {
            n5 = n3 + n4;
        }
        else {
            n5 = n4 * (1.0 + -Math.pow(2.0, -10.0f * n / n2)) + n3;
        }
        return (float)n5;
    }
}
