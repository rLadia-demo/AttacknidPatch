package org.anddev.andengine.engine;

import org.anddev.andengine.engine.options.*;

public class FixedStepEngine extends Engine
{
    private long mSecondsElapsedAccumulator;
    private final long mStepLength;
    
    public FixedStepEngine(final EngineOptions engineOptions, final int n) {
        super(engineOptions);
        this.mStepLength = 1000000000L / n;
    }
    
    public void onUpdate(final long n) throws InterruptedException {
        this.mSecondsElapsedAccumulator += n;
        final long mStepLength = this.mStepLength;
        while (this.mSecondsElapsedAccumulator >= mStepLength) {
            super.onUpdate(mStepLength);
            this.mSecondsElapsedAccumulator -= mStepLength;
        }
    }
}
