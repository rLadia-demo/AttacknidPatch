/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetFileDescriptor
 *  android.content.res.AssetManager
 *  android.media.MediaPlayer
 */
package org.anddev.andengine.audio.music;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.music.Music;
import org.anddev.andengine.audio.music.MusicManager;

public class MusicFactory {
    private static String sAssetBasePath = "";

    public static Music createMusicFromAsset(MusicManager musicManager, Context context, String string) throws IOException {
        MediaPlayer mediaPlayer = new MediaPlayer();
        AssetFileDescriptor assetFileDescriptor = context.getAssets().openFd(String.valueOf(MusicFactory.sAssetBasePath) + string);
        mediaPlayer.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
        mediaPlayer.prepare();
        Music music = new Music(musicManager, mediaPlayer);
        musicManager.add((IAudioEntity)music);
        return music;
    }

    public static Music createMusicFromFile(MusicManager musicManager, Context context, File file) throws IOException {
        MediaPlayer mediaPlayer = new MediaPlayer();
        mediaPlayer.setDataSource(new FileInputStream(file).getFD());
        mediaPlayer.prepare();
        Music music = new Music(musicManager, mediaPlayer);
        musicManager.add((IAudioEntity)music);
        return music;
    }

    public static Music createMusicFromResource(MusicManager musicManager, Context context, int n) throws IOException {
        MediaPlayer mediaPlayer = MediaPlayer.create((Context)context, (int)n);
        mediaPlayer.prepare();
        Music music = new Music(musicManager, mediaPlayer);
        musicManager.add((IAudioEntity)music);
        return music;
    }

    public static void setAssetBasePath(String string) {
        if (!string.endsWith("/") && string.length() != 0) throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
        MusicFactory.sAssetBasePath = string;
    }
}

