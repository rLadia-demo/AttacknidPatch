/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.media.SoundPool
 */
package org.anddev.andengine.audio.sound;

import android.media.SoundPool;
import org.anddev.andengine.audio.BaseAudioEntity;
import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.IAudioManager;
import org.anddev.andengine.audio.sound.SoundManager;

public class Sound
extends BaseAudioEntity {
    private int mLoopCount = 0;
    private float mRate = 1.0f;
    private final int mSoundID;
    private int mStreamID = 0;

    Sound(SoundManager soundManager, int n) {
        super(soundManager);
        this.mSoundID = n;
    }

    @Override
    protected SoundManager getAudioManager() {
        return (SoundManager)super.getAudioManager();
    }

    @Override
    public void onMasterVolumeChanged(float f) {
        this.setVolume(this.mLeftVolume, this.mRightVolume);
    }

    @Override
    public void pause() {
        if (this.mStreamID == 0) return;
        this.getAudioManager().getSoundPool().pause(this.mStreamID);
    }

    @Override
    public void play() {
        float f = this.getMasterVolume();
        float f2 = f * this.mLeftVolume;
        float f3 = f * this.mRightVolume;
        this.mStreamID = this.getAudioManager().getSoundPool().play(this.mSoundID, f2, f3, 1, this.mLoopCount, this.mRate);
    }

    @Override
    public void release() {
    }

    @Override
    public void resume() {
        if (this.mStreamID == 0) return;
        this.getAudioManager().getSoundPool().resume(this.mStreamID);
    }

    public void setLoopCount(int n) {
        this.mLoopCount = n;
        if (this.mStreamID == 0) return;
        this.getAudioManager().getSoundPool().setLoop(this.mStreamID, n);
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void setLooping(boolean bl) {
        int n = bl ? -1 : 0;
        this.setLoopCount(n);
    }

    public void setRate(float f) {
        this.mRate = f;
        if (this.mStreamID == 0) return;
        this.getAudioManager().getSoundPool().setRate(this.mStreamID, f);
    }

    @Override
    public void setVolume(float f, float f2) {
        super.setVolume(f, f2);
        if (this.mStreamID == 0) return;
        float f3 = this.getMasterVolume();
        float f4 = f3 * this.mLeftVolume;
        float f5 = f3 * this.mRightVolume;
        this.getAudioManager().getSoundPool().setVolume(this.mStreamID, f4, f5);
    }

    @Override
    public void stop() {
        if (this.mStreamID == 0) return;
        this.getAudioManager().getSoundPool().stop(this.mStreamID);
    }
}

