package org.anddev.andengine.audio.music;

import org.anddev.andengine.audio.*;
import android.media.*;

public class Music extends BaseAudioEntity
{
    private final MediaPlayer mMediaPlayer;
    
    Music(final MusicManager musicManager, final MediaPlayer mMediaPlayer) {
        super(musicManager);
        this.mMediaPlayer = mMediaPlayer;
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
    public void onMasterVolumeChanged(final float n) {
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
    
    public void seekTo(final int n) {
        this.mMediaPlayer.seekTo(n);
    }
    
    @Override
    public void setLooping(final boolean looping) {
        this.mMediaPlayer.setLooping(looping);
    }
    
    public void setOnCompletionListener(final MediaPlayer$OnCompletionListener onCompletionListener) {
        this.mMediaPlayer.setOnCompletionListener(onCompletionListener);
    }
    
    @Override
    public void setVolume(final float n, final float n2) {
        super.setVolume(n, n2);
        final float masterVolume = this.getAudioManager().getMasterVolume();
        this.mMediaPlayer.setVolume(n * masterVolume, n2 * masterVolume);
    }
    
    @Override
    public void stop() {
        this.mMediaPlayer.stop();
    }
}
