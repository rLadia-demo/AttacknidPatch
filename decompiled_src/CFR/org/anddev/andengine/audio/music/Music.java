/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.media.MediaPlayer
 *  android.media.MediaPlayer$OnCompletionListener
 */
package org.anddev.andengine.audio.music;

import android.media.MediaPlayer;
import org.anddev.andengine.audio.BaseAudioEntity;
import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.IAudioManager;
import org.anddev.andengine.audio.music.MusicManager;

public class Music
extends BaseAudioEntity {
    private final MediaPlayer mMediaPlayer;

    Music(MusicManager musicManager, MediaPlayer mediaPlayer) {
        super(musicManager);
        this.mMediaPlayer = mediaPlayer;
    }

    @Override
    protected MusicManager getAudioManager() {
        return (MusicManager)super.getAudioManager();
    }

    public MediaPlayer getMediaPlayer() {
        return this.mMediaPlayer;
    }

    public boolean isPlaying() {
        return this.mMediaPlayer.isPlaying();
    }

    @Override
    public void onMasterVolumeChanged(float f) {
        this.setVolume(this.mLeftVolume, this.mRightVolume);
    }

    @Override
    public void pause() {
        this.mMediaPlayer.pause();
    }

    @Override
    public void play() {
        this.mMediaPlayer.start();
    }

    @Override
    public void release() {
        this.mMediaPlayer.release();
    }

    @Override
    public void resume() {
        this.mMediaPlayer.start();
    }

    public void seekTo(int n) {
        this.mMediaPlayer.seekTo(n);
    }

    @Override
    public void setLooping(boolean bl) {
        this.mMediaPlayer.setLooping(bl);
    }

    public void setOnCompletionListener(MediaPlayer.OnCompletionListener onCompletionListener) {
        this.mMediaPlayer.setOnCompletionListener(onCompletionListener);
    }

    @Override
    public void setVolume(float f, float f2) {
        super.setVolume(f, f2);
        float f3 = this.getAudioManager().getMasterVolume();
        float f4 = f * f3;
        float f5 = f2 * f3;
        this.mMediaPlayer.setVolume(f4, f5);
    }

    @Override
    public void stop() {
        this.mMediaPlayer.stop();
    }
}

