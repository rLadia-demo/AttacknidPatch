/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetFileDescriptor
 *  android.content.res.AssetManager
 *  android.media.SoundPool
 */
package org.anddev.andengine.audio.sound;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.SoundPool;
import java.io.IOException;
import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.sound.Sound;
import org.anddev.andengine.audio.sound.SoundManager;

public class SoundFactory {
    private static String sAssetBasePath = "";

    public static Sound createSoundFromAsset(SoundManager soundManager, Context context, String string) throws IOException {
        Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(context.getAssets().openFd(String.valueOf(SoundFactory.sAssetBasePath) + string), 1));
        soundManager.add((IAudioEntity)sound);
        return sound;
    }

    public static Sound createSoundFromPath(SoundManager soundManager, Context context, String string) throws IOException {
        Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(string, 1));
        soundManager.add((IAudioEntity)sound);
        return sound;
    }

    public static Sound createSoundFromResource(SoundManager soundManager, Context context, int n) {
        Sound sound = new Sound(soundManager, soundManager.getSoundPool().load(context, n, 1));
        soundManager.add((IAudioEntity)sound);
        return sound;
    }

    public static void setAssetBasePath(String string) {
        if (!string.endsWith("/") && string.length() != 0) throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
        SoundFactory.sAssetBasePath = string;
    }
}

