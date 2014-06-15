package org.anddev.andengine.audio;

public abstract interface IAudioManager<T extends IAudioEntity>
{
  public abstract void add(T paramT);
  
  public abstract float getMasterVolume();
  
  public abstract void releaseAll();
  
  public abstract void setMasterVolume(float paramFloat);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.IAudioManager
 * JD-Core Version:    0.7.0.1
 */