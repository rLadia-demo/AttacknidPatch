package org.anddev.andengine.audio.sound;

import org.anddev.andengine.audio.*;

public class Sound extends BaseAudioEntity
{
    private int mLoopCount;
    private float mRate;
    private final int mSoundID;
    private int mStreamID;
    
    Sound(final SoundManager soundManager, final int mSoundID) {
        super(soundManager);
        this.mStreamID = 0;
        this.mLoopCount = 0;
        this.mRate = 1.0f;
        this.mSoundID = mSoundID;
    }
    
    @Override
    protected SoundManager getAudioManager() {
        return (SoundManager)super.getAudioManager();
    }
    
    @Override
    public void onMasterVolumeChanged(final float n) {
        this.setVolume(this.mLeftVolume, this.mRightVolume);
    }
    
    @Override
    public void pause() {
        if (this.mStreamID != 0) {
            this.getAudioManager().getSoundPool().pause(this.mStreamID);
        }
    }
    
    @Override
    public void play() {
        final float masterVolume = this.getMasterVolume();
        this.mStreamID = this.getAudioManager().getSoundPool().play(this.mSoundID, masterVolume * this.mLeftVolume, masterVolume * this.mRightVolume, 1, this.mLoopCount, this.mRate);
    }
    
    @Override
    public void release() {
    }
    
    @Override
    public void resume() {
        if (this.mStreamID != 0) {
            this.getAudioManager().getSoundPool().resume(this.mStreamID);
        }
    }
    
    public void setLoopCount(final int mLoopCount) {
        this.mLoopCount = mLoopCount;
        if (this.mStreamID != 0) {
            this.getAudioManager().getSoundPool().setLoop(this.mStreamID, mLoopCount);
        }
    }
    
    @Override
    public void setLooping(final boolean b) {
        int loopCount;
        if (b) {
            loopCount = -1;
        }
        else {
            loopCount = 0;
        }
        this.setLoopCount(loopCount);
    }
    
    public void setRate(final float mRate) {
        this.mRate = mRate;
        if (this.mStreamID != 0) {
            this.getAudioManager().getSoundPool().setRate(this.mStreamID, mRate);
        }
    }
    
    @Override
    public void setVolume(final float n, final float n2) {
        super.setVolume(n, n2);
        if (this.mStreamID != 0) {
            final float masterVolume = this.getMasterVolume();
            this.getAudioManager().getSoundPool().setVolume(this.mStreamID, masterVolume * this.mLeftVolume, masterVolume * this.mRightVolume);
        }
    }
    
    @Override
    public void stop() {
        if (this.mStreamID != 0) {
            this.getAudioManager().getSoundPool().stop(this.mStreamID);
        }
    }
}
