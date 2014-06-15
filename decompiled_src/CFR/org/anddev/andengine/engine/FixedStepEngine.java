/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine;

import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;

public class FixedStepEngine
extends Engine {
    private long mSecondsElapsedAccumulator;
    private final long mStepLength;

    public FixedStepEngine(EngineOptions engineOptions, int n) {
        super(engineOptions);
        this.mStepLength = 1000000000 / (long)n;
    }

    public void onUpdate(long l) throws InterruptedException {
        this.mSecondsElapsedAccumulator = l + this.mSecondsElapsedAccumulator;
        long l2 = this.mStepLength;
        while (this.mSecondsElapsedAccumulator >= l2) {
            super.onUpdate(l2);
            this.mSecondsElapsedAccumulator-=l2;
        }
        return;
    }
}

