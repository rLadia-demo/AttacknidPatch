package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialIn implements IEaseFunction
{
    private static EaseExponentialIn INSTANCE;
    
    public static EaseExponentialIn getInstance() {
        if (EaseExponentialIn.INSTANCE == null) {
            EaseExponentialIn.INSTANCE = new EaseExponentialIn();
        }
        return EaseExponentialIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        double n5;
        if (n == 0.0f) {
            n5 = n3;
        }
        else {
            n5 = n4 * Math.pow(2.0, 10.0f * (n / n2 - 1.0f)) + n3 - 0.001f * n4;
        }
        return (float)n5;
    }
}
