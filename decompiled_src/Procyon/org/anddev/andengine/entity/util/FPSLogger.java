package org.anddev.andengine.entity.util;

import org.anddev.andengine.util.*;

public class FPSLogger extends AverageFPSCounter
{
    protected float mLongestFrame;
    protected float mShortestFrame;
    
    public FPSLogger() {
        super();
        this.mShortestFrame = Float.MAX_VALUE;
        this.mLongestFrame = Float.MIN_VALUE;
    }
    
    public FPSLogger(final float n) {
        super(n);
        this.mShortestFrame = Float.MAX_VALUE;
        this.mLongestFrame = Float.MIN_VALUE;
    }
    
    @Override
    protected void onHandleAverageDurationElapsed(final float n) {
        this.onLogFPS();
        this.mLongestFrame = Float.MIN_VALUE;
        this.mShortestFrame = Float.MAX_VALUE;
    }
    
    protected void onLogFPS() {
        Debug.d(String.format("FPS: %.2f (MIN: %.0f ms | MAX: %.0f ms)", this.mFrames / this.mSecondsElapsed, 1000.0f * this.mShortestFrame, 1000.0f * this.mLongestFrame));
    }
    
    @Override
    public void onUpdate(final float n) {
        super.onUpdate(n);
        this.mShortestFrame = Math.min(this.mShortestFrame, n);
        this.mLongestFrame = Math.max(this.mLongestFrame, n);
    }
    
    @Override
    public void reset() {
        super.reset();
        this.mShortestFrame = Float.MAX_VALUE;
        this.mLongestFrame = Float.MIN_VALUE;
    }
}
