package org.anddev.andengine.audio;

import java.util.ArrayList;

public abstract class BaseAudioManager<T extends IAudioEntity>
  implements IAudioManager<T>
{
  protected final ArrayList<T> mAudioEntities = new ArrayList();
  protected float mMasterVolume = 1.0F;
  
  public void add(T paramT)
  {
    this.mAudioEntities.add(paramT);
  }
  
  public float getMasterVolume()
  {
    return this.mMasterVolume;
  }
  
  public void releaseAll()
  {
    ArrayList localArrayList = this.mAudioEntities;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      IAudioEntity localIAudioEntity = (IAudioEntity)localArrayList.get(i);
      localIAudioEntity.stop();
      localIAudioEntity.release();
    }
  }
  
  public void setMasterVolume(float paramFloat)
  {
    this.mMasterVolume = paramFloat;
    ArrayList localArrayList = this.mAudioEntities;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((IAudioEntity)localArrayList.get(i)).onMasterVolumeChanged(paramFloat);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.BaseAudioManager
 * JD-Core Version:    0.7.0.1
 */