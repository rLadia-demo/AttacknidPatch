package org.anddev.andengine.audio;

import java.util.*;

public abstract class BaseAudioManager<T extends IAudioEntity> implements IAudioManager<T>
{
    protected final ArrayList<T> mAudioEntities;
    protected float mMasterVolume;
    
    public BaseAudioManager() {
        super();
        this.mAudioEntities = new ArrayList<T>();
        this.mMasterVolume = 1.0f;
    }
    
    @Override
    public void add(final T t) {
        this.mAudioEntities.add(t);
    }
    
    @Override
    public float getMasterVolume() {
        return this.mMasterVolume;
    }
    
    @Override
    public void releaseAll() {
        final ArrayList<T> mAudioEntities = this.mAudioEntities;
        for (int i = -1 + mAudioEntities.size(); i >= 0; --i) {
            final IAudioEntity audioEntity = mAudioEntities.get(i);
            audioEntity.stop();
            audioEntity.release();
        }
    }
    
    @Override
    public void setMasterVolume(final float mMasterVolume) {
        this.mMasterVolume = mMasterVolume;
        final ArrayList<T> mAudioEntities = this.mAudioEntities;
        for (int i = -1 + mAudioEntities.size(); i >= 0; --i) {
            mAudioEntities.get(i).onMasterVolumeChanged(mMasterVolume);
        }
    }
}
