package org.anddev.andengine.audio.sound;

import org.anddev.andengine.audio.*;
import android.media.*;

public class SoundManager extends BaseAudioManager<Sound>
{
    private static final int MAX_SIMULTANEOUS_STREAMS_DEFAULT = 5;
    private final SoundPool mSoundPool;
    
    public SoundManager() {
        this(5);
    }
    
    public SoundManager(final int n) {
        super();
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
