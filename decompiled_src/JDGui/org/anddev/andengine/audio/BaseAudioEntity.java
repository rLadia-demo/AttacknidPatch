package org.anddev.andengine.audio;

public abstract class BaseAudioEntity
  implements IAudioEntity
{
  private final IAudioManager<? extends IAudioEntity> mAudioManager;
  protected float mLeftVolume = 1.0F;
  protected float mRightVolume = 1.0F;
  
  public BaseAudioEntity(IAudioManager<? extends IAudioEntity> paramIAudioManager)
  {
    this.mAudioManager = paramIAudioManager;
  }
  
  public float getActualLeftVolume()
  {
    return this.mLeftVolume * getMasterVolume();
  }
  
  public float getActualRightVolume()
  {
    return this.mRightVolume * getMasterVolume();
  }
  
  protected IAudioManager<? extends IAudioEntity> getAudioManager()
  {
    return this.mAudioManager;
  }
  
  public float getLeftVolume()
  {
    return this.mLeftVolume;
  }
  
  protected float getMasterVolume()
  {
    return this.mAudioManager.getMasterVolume();
  }
  
  public float getRightVolume()
  {
    return this.mRightVolume;
  }
  
  public float getVolume()
  {
    return 0.5F * (this.mLeftVolume + this.mRightVolume);
  }
  
  public final void setVolume(float paramFloat)
  {
    setVolume(paramFloat, paramFloat);
  }
  
  public void setVolume(float paramFloat1, float paramFloat2)
  {
    this.mLeftVolume = paramFloat1;
    this.mRightVolume = paramFloat2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.BaseAudioEntity
 * JD-Core Version:    0.7.0.1
 */