/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.audio;

import java.util.ArrayList;
import org.anddev.andengine.audio.IAudioEntity;
import org.anddev.andengine.audio.IAudioManager;

public abstract class BaseAudioManager<T extends IAudioEntity>
implements IAudioManager<T> {
    protected final ArrayList<T> mAudioEntities = new ArrayList<T>();
    protected float mMasterVolume = 1.0f;

    @Override
    public void add(T T) {
        this.mAudioEntities.add(T);
    }

    @Override
    public float getMasterVolume() {
        return this.mMasterVolume;
    }

    @Override
    public void releaseAll() {
        ArrayList<T> arrayList = this.mAudioEntities;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            IAudioEntity iAudioEntity = (IAudioEntity)arrayList.get(n);
            iAudioEntity.stop();
            iAudioEntity.release();
            --n;
        }
        return;
    }

    @Override
    public void setMasterVolume(float f) {
        this.mMasterVolume = f;
        ArrayList<T> arrayList = this.mAudioEntities;
        int n = -1 + arrayList.size();
        while (n >= 0) {
            ((IAudioEntity)arrayList.get(n)).onMasterVolumeChanged(f);
            --n;
        }
        return;
    }
}

