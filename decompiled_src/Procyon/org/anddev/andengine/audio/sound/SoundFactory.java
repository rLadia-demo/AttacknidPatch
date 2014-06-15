package org.anddev.andengine.audio.sound;

import android.content.*;
import java.io.*;

public class SoundFactory
{
    private static String sAssetBasePath;
    
    static {
        SoundFactory.sAssetBasePath = "";
    }
    
    public static Sound createSoundFromAsset(final SoundManager soundManager, final Context context, final String s) throws IOException {
        final Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(context.getAssets().openFd(String.valueOf(SoundFactory.sAssetBasePath) + s), 1));
        soundManager.add(sound);
        return sound;
    }
    
    public static Sound createSoundFromPath(final SoundManager soundManager, final Context context, final String s) throws IOException {
        final Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(s, 1));
        soundManager.add(sound);
        return sound;
    }
    
    public static Sound createSoundFromResource(final SoundManager soundManager, final Context context, final int n) {
        final Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(context, n, 1));
        soundManager.add(sound);
        return sound;
    }
    
    public static void setAssetBasePath(final String sAssetBasePath) {
        if (sAssetBasePath.endsWith("/") || sAssetBasePath.length() == 0) {
            SoundFactory.sAssetBasePath = sAssetBasePath;
            return;
        }
        throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
    }
}
