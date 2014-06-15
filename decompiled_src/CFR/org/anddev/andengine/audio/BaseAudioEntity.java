/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.audio;

import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.IAudioManager;

public abstract class BaseAudioEntity
implements IAudioEntity {
    private final IAudioManager<? extends IAudioEntity> mAudioManager;
    protected float mLeftVolume = 1.0f;
    protected float mRightVolume = 1.0f;

    public BaseAudioEntity(IAudioManager<? extends IAudioEntity> iAudioManager) {
        this.mAudioManager = iAudioManager;
    }

    public float getActualLeftVolume() {
        return this.mLeftVolume * this.getMasterVolume();
    }

    public float getActualRightVolume() {
        return this.mRightVolume * this.getMasterVolume();
    }

    protected IAudioManager<? extends IAudioEntity> getAudioManager() {
        return this.mAudioManager;
    }

    @Override
    public float getLeftVolume() {
        return this.mLeftVolume;
    }

    protected float getMasterVolume() {
        return this.mAudioManager.getMasterVolume();
    }

    @Override
    public float getRightVolume() {
        return this.mRightVolume;
    }

    @Override
    public float getVolume() {
        return 0.5f * (this.mLeftVolume + this.mRightVolume);
    }

    @Override
    public final void setVolume(float f) {
        this.setVolume(f, f);
    }

    @Override
    public void setVolume(float f, float f2) {
        this.mLeftVolume = f;
        this.mRightVolume = f2;
    }
}

