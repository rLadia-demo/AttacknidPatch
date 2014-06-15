package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.util.constants.*;
import org.anddev.andengine.util.*;

public class FrameCountCrasher implements IUpdateHandler, TimeConstants
{
    private final float[] mFrameLengths;
    private int mFramesLeft;
    
    public FrameCountCrasher(final int mFramesLeft) {
        super();
        this.mFramesLeft = mFramesLeft;
        this.mFrameLengths = new float[mFramesLeft];
    }
    
    @Override
    public void onUpdate(final float n) {
        --this.mFramesLeft;
        final float[] mFrameLengths = this.mFrameLengths;
        if (this.mFramesLeft >= 0) {
            mFrameLengths[this.mFramesLeft] = n;
            return;
        }
        for (int i = -1 + mFrameLengths.length; i >= 0; --i) {
            Debug.d("Elapsed: " + mFrameLengths[i]);
        }
        throw new RuntimeException();
    }
    
    @Override
    public void reset() {
    }
}
