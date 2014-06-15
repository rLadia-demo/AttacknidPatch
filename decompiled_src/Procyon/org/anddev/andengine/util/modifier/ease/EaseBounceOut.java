package org.anddev.andengine.util.modifier.ease;

public class EaseBounceOut implements IEaseFunction
{
    private static EaseBounceOut INSTANCE;
    
    public static EaseBounceOut getInstance() {
        if (EaseBounceOut.INSTANCE == null) {
            EaseBounceOut.INSTANCE = new EaseBounceOut();
        }
        return EaseBounceOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        if (n5 < 0.36363636363636365) {
            return n3 + n4 * (n5 * (7.5625f * n5));
        }
        if (n5 < 0.7272727272727273) {
            final float n6 = n5 - 0.54545456f;
            return n3 + n4 * (0.75f + n6 * (7.5625f * n6));
        }
        if (n5 < 0.9090909090909091) {
            final float n7 = n5 - 0.8181818f;
            return n3 + n4 * (0.9375f + n7 * (7.5625f * n7));
        }
        final float n8 = n5 - 0.95454544f;
        return n3 + n4 * (0.984375f + n8 * (7.5625f * n8));
    }
}
