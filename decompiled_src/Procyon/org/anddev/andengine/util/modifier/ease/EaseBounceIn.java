package org.anddev.andengine.util.modifier.ease;

public class EaseBounceIn implements IEaseFunction
{
    private static EaseBounceIn INSTANCE;
    
    public static EaseBounceIn getInstance() {
        if (EaseBounceIn.INSTANCE == null) {
            EaseBounceIn.INSTANCE = new EaseBounceIn();
        }
        return EaseBounceIn.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        return n3 + (n4 - EaseBounceOut.getInstance().getPercentageDone(n2 - n, n2, 0.0f, n4));
    }
}
