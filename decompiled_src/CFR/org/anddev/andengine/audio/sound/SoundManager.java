/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.media.SoundPool
 */
package org.anddev.andengine.audio.sound;

import android.media.SoundPool;
import org.anddev.andengine.audio.BaseAudioManager;
import org.anddev.andengine.audio.sound.Sound;

public class SoundManager
extends BaseAudioManager<Sound> {
    private static final int MAX_SIMULTANEOUS_STREAMS_DEFAULT = 5;
    private final SoundPool mSoundPool;

    public SoundManager() {
        this(5);
    }

    public SoundManager(int n) {
        this.mSoundPool = new SoundPool(n, 3, 0);
    }

    SoundPool getSoundPool() {
        return this.mSoundPool;
    }

    @Override
    public void releaseAll() {
        super.releaseAll();
        this.mSoundPool.release();
    }
}

