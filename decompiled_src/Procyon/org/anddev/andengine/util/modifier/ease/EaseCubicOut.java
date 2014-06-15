package org.anddev.andengine.util.modifier.ease;

public class EaseCubicOut implements IEaseFunction
{
    private static EaseCubicOut INSTANCE;
    
    public static EaseCubicOut getInstance() {
        if (EaseCubicOut.INSTANCE == null) {
            EaseCubicOut.INSTANCE = new EaseCubicOut();
        }
        return EaseCubicOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2 - 1.0f;
        return n3 + n4 * (1.0f + n5 * (n5 * n5));
    }
}
