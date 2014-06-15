/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.util;

import org.anddev.andengine.entity.util.AverageFPSCounter;
import org.anddev.andengine.util.Debug;

public class FPSLogger
extends AverageFPSCounter {
    protected float mLongestFrame = 1.4E-45f;
    protected float mShortestFrame = 3.4028235E38f;

    public FPSLogger() {
    }

    public FPSLogger(float f) {
        super(f);
    }

    @Override
    protected void onHandleAverageDurationElapsed(float f) {
        this.onLogFPS();
        this.mLongestFrame = 1.4E-45f;
        this.mShortestFrame = 3.4028235E38f;
    }

    protected void onLogFPS() {
        Object[] arrobject = new Object[]{Float.valueOf((float)this.mFrames / this.mSecondsElapsed), Float.valueOf(1000.0f * this.mShortestFrame), Float.valueOf(1000.0f * this.mLongestFrame)};
        Debug.d(String.format("FPS: %.2f (MIN: %.0f ms | MAX: %.0f ms)", arrobject));
    }

    @Override
    public void onUpdate(float f) {
        super.onUpdate(f);
        this.mShortestFrame = Math.min(this.mShortestFrame, f);
        this.mLongestFrame = Math.max(this.mLongestFrame, f);
    }

    @Override
    public void reset() {
        super.reset();
        this.mShortestFrame = 3.4028235E38f;
        this.mLongestFrame = 1.4E-45f;
    }
}

