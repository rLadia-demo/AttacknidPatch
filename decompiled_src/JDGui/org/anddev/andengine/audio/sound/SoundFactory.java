package org.anddev.andengine.audio.sound;

import android.content.Context;
import android.content.res.AssetManager;
import android.media.SoundPool;
import java.io.IOException;

public class SoundFactory
{
  private static String sAssetBasePath = "";
  
  public static Sound createSoundFromAsset(SoundManager paramSoundManager, Context paramContext, String paramString)
    throws IOException
  {
    Sound localSound = new Sound(paramSoundManager, paramSoundManager.getSoundPool().load(paramContext.getAssets().openFd(sAssetBasePath + paramString), 1));
    paramSoundManager.add(localSound);
    return localSound;
  }
  
  public static Sound createSoundFromPath(SoundManager paramSoundManager, Context paramContext, String paramString)
    throws IOException
  {
    Sound localSound = new Sound(paramSoundManager, paramSoundManager.getSoundPool().load(paramString, 1));
    paramSoundManager.add(localSound);
    return localSound;
  }
  
  public static Sound createSoundFromResource(SoundManager paramSoundManager, Context paramContext, int paramInt)
  {
    Sound localSound = new Sound(paramSoundManager, paramSoundManager.getSoundPool().load(paramContext, paramInt, 1));
    paramSoundManager.add(localSound);
    return localSound;
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
 * Qualified Name:     org.anddev.andengine.audio.sound.SoundFactory
 * JD-Core Version:    0.7.0.1
 */