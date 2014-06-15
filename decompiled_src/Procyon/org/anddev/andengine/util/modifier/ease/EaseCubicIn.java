package org.anddev.andengine.util.modifier.ease;

public class EaseCubicIn implements IEaseFunction
{
    private static EaseCubicIn INSTANCE;
    
    public static EaseCubicIn getInstance() {
        if (EaseCubicIn.INSTANCE == null) {
            EaseCubicIn.INSTANCE = new EaseCubicIn();
        }
        return EaseCubicIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n5 * (n4 * n5));
    }
}
