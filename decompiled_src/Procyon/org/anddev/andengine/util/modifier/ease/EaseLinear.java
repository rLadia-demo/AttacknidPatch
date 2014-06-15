package org.anddev.andengine.util.modifier.ease;

public class EaseLinear implements IEaseFunction
{
    private static EaseLinear INSTANCE;
    
    public static EaseLinear getInstance() {
        if (EaseLinear.INSTANCE == null) {
            EaseLinear.INSTANCE = new EaseLinear();
        }
        return EaseLinear.INSTANCE;
    }
    
    @Override
    public float getPercentageDone(final float n, final float n2, final float n3, final float n4) {
        return n3 + n4 * n / n2;
    }
}
