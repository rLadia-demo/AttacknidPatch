package org.anddev.andengine.audio;

public interface IAudioManager<T extends IAudioEntity>
{
    void add(T p0);
    
    float getMasterVolume();
    
    void releaseAll();
    
    void setMasterVolume(float p0);
}
