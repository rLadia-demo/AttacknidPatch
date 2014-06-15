package org.anddev.andengine.audio.music;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import org.anddev.andengine.audio.BaseAudioEntity;

public class Music
  extends BaseAudioEntity
{
  private final MediaPlayer mMediaPlayer;
  
  Music(MusicManager paramMusicManager, MediaPlayer paramMediaPlayer)
  {
    super(paramMusicManager);
    this.mMediaPlayer = paramMediaPlayer;
  }
  
  protected MusicManager getAudioManager()
  {
    return (MusicManager)super.getAudioManager();
  }
  
  public MediaPlayer getMediaPlayer()
  {
    return this.mMediaPlayer;
  }
  
  public boolean isPlaying()
  {
    return this.mMediaPlayer.isPlaying();
  }
  
  public void onMasterVolumeChanged(float paramFloat)
  {
    setVolume(this.mLeftVolume, this.mRightVolume);
  }
  
  public void pause()
  {
    this.mMediaPlayer.pause();
  }
  
  public void play()
  {
    this.mMediaPlayer.start();
  }
  
  public void release()
  {
    this.mMediaPlayer.release();
  }
  
  public void resume()
  {
    this.mMediaPlayer.start();
  }
  
  public void seekTo(int paramInt)
  {
    this.mMediaPlayer.seekTo(paramInt);
  }
  
  public void setLooping(boolean paramBoolean)
  {
    this.mMediaPlayer.setLooping(paramBoolean);
  }
  
  public void setOnCompletionListener(MediaPlayer.OnCompletionListener paramOnCompletionListener)
  {
    this.mMediaPlayer.setOnCompletionListener(paramOnCompletionListener);
  }
  
  public void setVolume(float paramFloat1, float paramFloat2)
  {
    super.setVolume(paramFloat1, paramFloat2);
    float f1 = getAudioManager().getMasterVolume();
    float f2 = paramFloat1 * f1;
    float f3 = paramFloat2 * f1;
    this.mMediaPlayer.setVolume(f2, f3);
  }
  
  public void stop()
  {
    this.mMediaPlayer.stop();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.music.Music
 * JD-Core Version:    0.7.0.1
 */