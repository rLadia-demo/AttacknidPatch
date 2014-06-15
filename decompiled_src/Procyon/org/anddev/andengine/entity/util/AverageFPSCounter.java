package org.anddev.andengine.entity.util;

import org.anddev.andengine.util.constants.*;

public abstract class AverageFPSCounter extends FPSCounter implements TimeConstants
{
    private static final float AVERAGE_DURATION_DEFAULT = 5.0f;
    protected final float mAverageDuration;
    
    public AverageFPSCounter() {
        this(5.0f);
    }
    
    public AverageFPSCounter(final float mAverageDuration) {
        super();
        this.mAverageDuration = mAverageDuration;
    }
    
    protected abstract void onHandleAverageDurationElapsed(final float p0);
    
    @Override
    public void onUpdate(final float n) {
        super.onUpdate(n);
        if (this.mSecondsElapsed > this.mAverageDuration) {
            this.onHandleAverageDurationElapsed(this.getFPS());
            this.mSecondsElapsed -= this.mAverageDuration;
            this.mFrames = 0;
        }
    }
}
