package org.anddev.andengine.audio;

public interface IAudioEntity
{
    float getLeftVolume();
    
    float getRightVolume();
    
    float getVolume();
    
    void onMasterVolumeChanged(float p0);
    
    void pause();
    
    void play();
    
    void release();
    
    void resume();
    
    void setLooping(boolean p0);
    
    void setVolume(float p0);
    
    void setVolume(float p0, float p1);
    
    void stop();
}
