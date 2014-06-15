package org.anddev.andengine.audio;

public abstract interface IAudioEntity
{
  public abstract float getLeftVolume();
  
  public abstract float getRightVolume();
  
  public abstract float getVolume();
  
  public abstract void onMasterVolumeChanged(float paramFloat);
  
  public abstract void pause();
  
  public abstract void play();
  
  public abstract void release();
  
  public abstract void resume();
  
  public abstract void setLooping(boolean paramBoolean);
  
  public abstract void setVolume(float paramFloat);
  
  public abstract void setVolume(float paramFloat1, float paramFloat2);
  
  public abstract void stop();
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.IAudioEntity
 * JD-Core Version:    0.7.0.1
 */