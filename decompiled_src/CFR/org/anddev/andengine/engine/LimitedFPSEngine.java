/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine;

import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.options.EngineOptions;

public class LimitedFPSEngine
extends Engine {
    private final long mPreferredFrameLengthNanoseconds;

    public LimitedFPSEngine(EngineOptions engineOptions, int n) {
        super(engineOptions);
        this.mPreferredFrameLengthNanoseconds = 1000000000 / (long)n;
    }

    public void onUpdate(long l) throws InterruptedException {
        long l2 = this.mPreferredFrameLengthNanoseconds - l;
        if (l2 <= 0) {
            super.onUpdate(l);
            return;
        }
        Thread.sleep((int)(l2 / 1000000));
        super.onUpdate(l + l2);
    }
}

