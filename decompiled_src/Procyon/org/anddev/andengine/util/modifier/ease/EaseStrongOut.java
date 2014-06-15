package org.anddev.andengine.util.modifier.ease;

public class EaseStrongOut implements IEaseFunction
{
    private static EaseStrongOut INSTANCE;
    
    public static EaseStrongOut getInstance() {
        if (EaseStrongOut.INSTANCE == null) {
            EaseStrongOut.INSTANCE = new EaseStrongOut();
        }
        return EaseStrongOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2 - 1.0f;
        return n3 + n4 * (1.0f + n5 * (n5 * (n5 * (n5 * n5))));
    }
}
