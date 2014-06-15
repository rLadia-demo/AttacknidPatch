package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.*;

public class FrameCounter implements IUpdateHandler
{
    private int mFrames;
    
    public int getFrames() {
        return this.mFrames;
    }
    
    @Override
    public void onUpdate(final float n) {
        ++this.mFrames;
    }
    
    @Override
    public void reset() {
        this.mFrames = 0;
    }
}
