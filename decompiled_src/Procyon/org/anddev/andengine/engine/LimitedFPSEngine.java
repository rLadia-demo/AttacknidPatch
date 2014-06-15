package org.anddev.andengine.engine;

import org.anddev.andengine.engine.options.*;

public class LimitedFPSEngine extends Engine
{
    private final long mPreferredFrameLengthNanoseconds;
    
    public LimitedFPSEngine(final EngineOptions engineOptions, final int n) {
        super(engineOptions);
        this.mPreferredFrameLengthNanoseconds = 1000000000L / n;
    }
    
    public void onUpdate(final long n) throws InterruptedException {
        final long n2 = this.mPreferredFrameLengthNanoseconds - n;
        if (n2 <= 0L) {
            super.onUpdate(n);
            return;
        }
        Thread.sleep((int)(n2 / 1000000L));
        super.onUpdate(n + n2);
    }
}
