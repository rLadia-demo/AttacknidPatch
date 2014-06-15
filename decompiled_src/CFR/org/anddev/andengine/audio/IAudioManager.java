/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.audio;

import org.anddev.andengine.audio.IAudioEntity;

public interface IAudioManager<T extends IAudioEntity> {
    public void add(T var1);

    public float getMasterVolume();

    public void releaseAll();

    public void setMasterVolume(float var1);
}

