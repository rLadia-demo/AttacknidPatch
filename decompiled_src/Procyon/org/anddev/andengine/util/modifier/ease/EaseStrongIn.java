package org.anddev.andengine.util.modifier.ease;

public class EaseStrongIn implements IEaseFunction
{
    private static EaseStrongIn INSTANCE;
    
    public static EaseStrongIn getInstance() {
        if (EaseStrongIn.INSTANCE == null) {
            EaseStrongIn.INSTANCE = new EaseStrongIn();
        }
        return EaseStrongIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n5 * (n5 * (n5 * (n4 * n5))));
    }
}
