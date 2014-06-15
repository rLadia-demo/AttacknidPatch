package org.anddev.andengine.audio.sound;

import android.media.SoundPool;
import org.anddev.andengine.audio.BaseAudioEntity;

public class Sound
  extends BaseAudioEntity
{
  private int mLoopCount = 0;
  private float mRate = 1.0F;
  private final int mSoundID;
  private int mStreamID = 0;
  
  Sound(SoundManager paramSoundManager, int paramInt)
  {
    super(paramSoundManager);
    this.mSoundID = paramInt;
  }
  
  protected SoundManager getAudioManager()
  {
    return (SoundManager)super.getAudioManager();
  }
  
  public void onMasterVolumeChanged(float paramFloat)
  {
    setVolume(this.mLeftVolume, this.mRightVolume);
  }
  
  public void pause()
  {
    if (this.mStreamID != 0) {
      getAudioManager().getSoundPool().pause(this.mStreamID);
    }
  }
  
  public void play()
  {
    float f1 = getMasterVolume();
    float f2 = f1 * this.mLeftVolume;
    float f3 = f1 * this.mRightVolume;
    this.mStreamID = getAudioManager().getSoundPool().play(this.mSoundID, f2, f3, 1, this.mLoopCount, this.mRate);
  }
  
  public void release() {}
  
  public void resume()
  {
    if (this.mStreamID != 0) {
      getAudioManager().getSoundPool().resume(this.mStreamID);
    }
  }
  
  public void setLoopCount(int paramInt)
  {
    this.mLoopCount = paramInt;
    if (this.mStreamID != 0) {
      getAudioManager().getSoundPool().setLoop(this.mStreamID, paramInt);
    }
  }
  
  public void setLooping(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = -1;; i = 0)
    {
      setLoopCount(i);
      return;
    }
  }
  
  public void setRate(float paramFloat)
  {
    this.mRate = paramFloat;
    if (this.mStreamID != 0) {
      getAudioManager().getSoundPool().setRate(this.mStreamID, paramFloat);
    }
  }
  
  public void setVolume(float paramFloat1, float paramFloat2)
  {
    super.setVolume(paramFloat1, paramFloat2);
    if (this.mStreamID != 0)
    {
      float f1 = getMasterVolume();
      float f2 = f1 * this.mLeftVolume;
      float f3 = f1 * this.mRightVolume;
      getAudioManager().getSoundPool().setVolume(this.mStreamID, f2, f3);
    }
  }
  
  public void stop()
  {
    if (this.mStreamID != 0) {
      getAudioManager().getSoundPool().stop(this.mStreamID);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.sound.Sound
 * JD-Core Version:    0.7.0.1
 */