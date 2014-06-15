package org.anddev.andengine.util.modifier.ease;

public class EaseBackInOut implements IEaseFunction
{
    private static EaseBackInOut INSTANCE;
    
    public static EaseBackInOut getInstance() {
        if (EaseBackInOut.INSTANCE == null) {
            EaseBackInOut.INSTANCE = new EaseBackInOut();
        }
        return EaseBackInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / (n2 * 0.5f);
        if (n5 < 1.0f) {
            final float n6 = n4 * 0.5f;
            final float n7 = n5 * n5;
            final float n8 = 1.70158f * 1.525f;
            return n3 + n6 * (n7 * (n5 * (1.0f + n8) - n8));
        }
        final float n9 = n4 / 2.0f;
        final float n10 = n5 - 2.0f;
        final float n11 = n10 * n10;
        final float n12 = 1.70158f * 1.525f;
        return n3 + n9 * (2.0f + n11 * (n12 + n10 * (1.0f + n12)));
    }
}
