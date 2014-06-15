/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.audio;

public interface IAudioEntity {
    public float getLeftVolume();

    public float getRightVolume();

    public float getVolume();

    public void onMasterVolumeChanged(float var1);

    public void pause();

    public void play();

    public void release();

    public void resume();

    public void setLooping(boolean var1);

    public void setVolume(float var1);

    public void setVolume(float var1, float var2);

    public void stop();
}

