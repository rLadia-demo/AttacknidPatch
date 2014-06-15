package org.helllabs.android.xmp;

import android.media.AudioTrack;

public class ModPlayer
{
  private static ModPlayer instance = null;
  private AudioTrack audio;
  private int minSize = AudioTrack.getMinBufferSize(44100, 3, 2);
  protected boolean paused;
  private Thread playThread;
  private Xmp xmp = new Xmp();
  
  protected ModPlayer()
  {
    if (this.minSize < i) {}
    for (;;)
    {
      this.audio = new AudioTrack(3, 44100, 3, 2, i, 1);
      return;
      i = this.minSize;
    }
  }
  
  public static ModPlayer getInstance()
  {
    if (instance == null)
    {
      instance = new ModPlayer();
      instance.xmp.init();
      instance.paused = false;
    }
    return instance;
  }
  
  protected void finalize()
  {
    this.xmp.stopModule();
    this.paused = false;
    try
    {
      this.playThread.join();
      label20:
      this.xmp.deinit();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label20;
    }
  }
  
  public int getPlayBpm()
  {
    return this.xmp.getPlayBpm();
  }
  
  public int getPlayPat()
  {
    return this.xmp.getPlayPat();
  }
  
  public int getPlayPos()
  {
    return this.xmp.getPlayPos();
  }
  
  public int getPlayTempo()
  {
    return this.xmp.getPlayTempo();
  }
  
  public boolean isPaused()
  {
    return this.paused;
  }
  
  public void pause()
  {
    if (this.paused) {}
    for (boolean bool = false;; bool = true)
    {
      this.paused = bool;
      return;
    }
  }
  
  public void play(String paramString)
  {
    if (this.xmp.loadModule(paramString) < 0) {
      return;
    }
    this.audio.play();
    this.xmp.startPlayer();
    this.playThread = new Thread(new PlayRunnable(null));
    this.playThread.start();
  }
  
  public void seek(int paramInt)
  {
    this.xmp.seek(paramInt);
  }
  
  public void stop()
  {
    this.xmp.stopModule();
    this.paused = false;
  }
  
  public int time()
  {
    return this.xmp.time();
  }
  
  private class PlayRunnable
    implements Runnable
  {
    private PlayRunnable() {}
    
    public void run()
    {
      short[] arrayOfShort = new short[ModPlayer.this.minSize];
      for (;;)
      {
        if (ModPlayer.this.xmp.playFrame() != 0)
        {
          ModPlayer.this.audio.stop();
          ModPlayer.this.xmp.endPlayer();
          ModPlayer.this.xmp.releaseModule();
          return;
        }
        int i = ModPlayer.this.xmp.softmixer();
        arrayOfShort = ModPlayer.this.xmp.getBuffer(i, arrayOfShort);
        ModPlayer.this.audio.write(arrayOfShort, 0, i / 2);
        while (ModPlayer.this.paused) {
          try
          {
            Thread.sleep(500L);
          }
          catch (InterruptedException localInterruptedException) {}
        }
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.helllabs.android.xmp.ModPlayer
 * JD-Core Version:    0.7.0.1
 */