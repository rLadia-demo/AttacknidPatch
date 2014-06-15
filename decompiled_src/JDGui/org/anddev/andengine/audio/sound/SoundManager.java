package org.anddev.andengine.audio.sound;

import android.media.SoundPool;
import org.anddev.andengine.audio.BaseAudioManager;

public class SoundManager
  extends BaseAudioManager<Sound>
{
  private static final int MAX_SIMULTANEOUS_STREAMS_DEFAULT = 5;
  private final SoundPool mSoundPool;
  
  public SoundManager()
  {
    this(5);
  }
  
  public SoundManager(int paramInt)
  {
    this.mSoundPool = new SoundPool(paramInt, 3, 0);
  }
  
  SoundPool getSoundPool()
  {
    return this.mSoundPool;
  }
  
  public void releaseAll()
  {
    super.releaseAll();
    this.mSoundPool.release();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.sound.SoundManager
 * JD-Core Version:    0.7.0.1
 */