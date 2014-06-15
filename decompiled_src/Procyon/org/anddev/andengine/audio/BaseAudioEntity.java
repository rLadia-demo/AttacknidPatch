package org.anddev.andengine.audio;

public abstract class BaseAudioEntity implements IAudioEntity
{
    private final IAudioManager<? extends IAudioEntity> mAudioManager;
    protected float mLeftVolume;
    protected float mRightVolume;
    
    public BaseAudioEntity(final IAudioManager<? extends IAudioEntity> mAudioManager) {
        super();
        this.mLeftVolume = 1.0f;
        this.mRightVolume = 1.0f;
        this.mAudioManager = mAudioManager;
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
    public final void setVolume(final float n) {
        this.setVolume(n, n);
    }
    
    @Override
    public void setVolume(final float mLeftVolume, final float mRightVolume) {
        this.mLeftVolume = mLeftVolume;
        this.mRightVolume = mRightVolume;
    }
}
