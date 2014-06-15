package org.anddev.andengine.audio.music;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class MusicFactory
{
  private static String sAssetBasePath = "";
  
  public static Music createMusicFromAsset(MusicManager paramMusicManager, Context paramContext, String paramString)
    throws IOException
  {
    MediaPlayer localMediaPlayer = new MediaPlayer();
    AssetFileDescriptor localAssetFileDescriptor = paramContext.getAssets().openFd(sAssetBasePath + paramString);
    localMediaPlayer.setDataSource(localAssetFileDescriptor.getFileDescriptor(), localAssetFileDescriptor.getStartOffset(), localAssetFileDescriptor.getLength());
    localMediaPlayer.prepare();
    Music localMusic = new Music(paramMusicManager, localMediaPlayer);
    paramMusicManager.add(localMusic);
    return localMusic;
  }
  
  public static Music createMusicFromFile(MusicManager paramMusicManager, Context paramContext, File paramFile)
    throws IOException
  {
    MediaPlayer localMediaPlayer = new MediaPlayer();
    localMediaPlayer.setDataSource(new FileInputStream(paramFile).getFD());
    localMediaPlayer.prepare();
    Music localMusic = new Music(paramMusicManager, localMediaPlayer);
    paramMusicManager.add(localMusic);
    return localMusic;
  }
  
  public static Music createMusicFromResource(MusicManager paramMusicManager, Context paramContext, int paramInt)
    throws IOException
  {
    MediaPlayer localMediaPlayer = MediaPlayer.create(paramContext, paramInt);
    localMediaPlayer.prepare();
    Music localMusic = new Music(paramMusicManager, localMediaPlayer);
    paramMusicManager.add(localMusic);
    return localMusic;
  }
  
  public static void setAssetBasePath(String paramString)
  {
    if ((paramString.endsWith("/")) || (paramString.length() == 0))
    {
      sAssetBasePath = paramString;
      return;
    }
    throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.audio.music.MusicFactory
 * JD-Core Version:    0.7.0.1
 */