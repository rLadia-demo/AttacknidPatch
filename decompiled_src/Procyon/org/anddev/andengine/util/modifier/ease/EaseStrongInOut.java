package org.anddev.andengine.util.modifier.ease;

public class EaseStrongInOut implements IEaseFunction
{
    private static EaseStrongInOut INSTANCE;
    
    public static EaseStrongInOut getInstance() {
        if (EaseStrongInOut.INSTANCE == null) {
            EaseStrongInOut.INSTANCE = new EaseStrongInOut();
        }
        return EaseStrongInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / (n2 * 0.5f);
        if (n5 < 1.0f) {
            return n3 + n5 * (n5 * (n5 * (n5 * (n5 * (n4 * 0.5f)))));
        }
        final float n6 = n4 * 0.5f;
        final float n7 = n5 - 2.0f;
        return n3 + n6 * (2.0f + n7 * (n7 * (n7 * (n7 * n7))));
    }
}
