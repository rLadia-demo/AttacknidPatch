package org.anddev.andengine.util.modifier.ease;

public class EaseBounceInOut implements IEaseFunction
{
    private static EaseBounceInOut INSTANCE;
    
    public static EaseBounceInOut getInstance() {
        if (EaseBounceInOut.INSTANCE == null) {
            EaseBounceInOut.INSTANCE = new EaseBounceInOut();
        }
        return EaseBounceInOut.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        if (n < 0.5 * n2) {
            return n3 + 0.5f * EaseBounceIn.getInstance().getPercentageDone(n * 2.0f, n2, 0.0f, n4);
        }
        return n3 + (0.5f * EaseBounceOut.getInstance().getPercentageDone(n * 2.0f - n2, n2, 0.0f, n4) + n4 * 0.5f);
    }
}
