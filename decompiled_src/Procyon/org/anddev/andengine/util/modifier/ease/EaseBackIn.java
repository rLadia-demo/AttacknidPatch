package org.anddev.andengine.util.modifier.ease;

public class EaseBackIn implements IEaseFunction
{
    private static EaseBackIn INSTANCE;
    
    public static EaseBackIn getInstance() {
        if (EaseBackIn.INSTANCE == null) {
            EaseBackIn.INSTANCE = new EaseBackIn();
        }
        return EaseBackIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        final float n5 = n / n2;
        return n3 + n5 * (n4 * n5) * (2.70158f * n5 - 1.70158f);
    }
}
