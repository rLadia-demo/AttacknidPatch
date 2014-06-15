package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.*;

public class FPSCounter implements IUpdateHandler
{
    protected int mFrames;
    protected float mSecondsElapsed;
    
    public float getFPS() {
        return this.mFrames / this.mSecondsElapsed;
    }
    
    @Override
    public void onUpdate(final float n) {
        ++this.mFrames;
        this.mSecondsElapsed += n;
    }
    
    @Override
    public void reset() {
        this.mFrames = 0;
        this.mSecondsElapsed = 0.0f;
    }
}
