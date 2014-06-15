package org.anddev.andengine.util.modifier;

public interface IModifier<T> extends Cloneable
{
    IModifier<T> clone();
    
    float getDuration();
    
    IModifierListener<T> getModifierListener();
    
    boolean isFinished();
    
    boolean isRemoveWhenFinished();
    
    void onUpdate(float p0, T p1);
    
    void reset();
    
    void setModifierListener(IModifierListener<T> p0);
    
    void setRemoveWhenFinished(boolean p0);
    
    public interface IModifierListener<T>
    {
        void onModifierFinished(IModifier<T> p0, T p1);
    }
}
