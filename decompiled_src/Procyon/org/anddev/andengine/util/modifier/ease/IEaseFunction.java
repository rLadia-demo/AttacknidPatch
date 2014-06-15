package org.anddev.andengine.util.modifier.ease;

public interface IEaseFunction
{
    public static final IEaseFunction DEFAULT = EaseLinear.getInstance();
    
    float getPercentageDone(float p0, float p1, float p2, float p3);
}
