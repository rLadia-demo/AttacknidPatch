package org.anddev.andengine.audio.music;

import android.content.*;
import android.media.*;
import android.content.res.*;
import java.io.*;

public class MusicFactory
{
    private static String sAssetBasePath;
    
    static {
        MusicFactory.sAssetBasePath = "";
    }
    
    public static Music createMusicFromAsset(final MusicManager musicManager, final Context context, final String s) throws IOException {
        final MediaPlayer mediaPlayer = new MediaPlayer();
        final AssetFileDescriptor openFd = context.getAssets().openFd(String.valueOf(MusicFactory.sAssetBasePath) + s);
        mediaPlayer.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
        mediaPlayer.prepare();
        final Music music = new Music(musicManager, mediaPlayer);
        musicManager.add(music);
        return music;
    }
    
    public static Music createMusicFromFile(final MusicManager musicManager, final Context context, final File file) throws IOException {
        final MediaPlayer mediaPlayer = new MediaPlayer();
        mediaPlayer.setDataSource(new FileInputStream(file).getFD());
        mediaPlayer.prepare();
        final Music music = new Music(musicManager, mediaPlayer);
        musicManager.add(music);
        return music;
    }
    
    public static Music createMusicFromResource(final MusicManager musicManager, final Context context, final int n) throws IOException {
        final MediaPlayer create = MediaPlayer.create(context, n);
        create.prepare();
        final Music music = new Music(musicManager, create);
        musicManager.add(music);
        return music;
    }
    
    public static void setAssetBasePath(final String sAssetBasePath) {
        if (sAssetBasePath.endsWith("/") || sAssetBasePath.length() == 0) {
            MusicFactory.sAssetBasePath = sAssetBasePath;
            return;
        }
        throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
    }
}
