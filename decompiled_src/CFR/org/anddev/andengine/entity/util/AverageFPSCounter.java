/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.util;

import org.anddev.andengine.entity.util.FPSCounter;
import org.anddev.andengine.util.constants.TimeConstants;

public abstract class AverageFPSCounter
extends FPSCounter
implements TimeConstants {
    private static final float AVERAGE_DURATION_DEFAULT = 5.0f;
    protected final float mAverageDuration;

    public AverageFPSCounter() {
        this(5.0f);
    }

    public AverageFPSCounter(float f) {
        this.mAverageDuration = f;
    }

    protected abstract void onHandleAverageDurationElapsed(float var1);

    @Override
    public void onUpdate(float f) {
        super.onUpdate(f);
        if (this.mSecondsElapsed <= this.mAverageDuration) return;
        this.onHandleAverageDurationElapsed(this.getFPS());
        this.mSecondsElapsed-=this.mAverageDuration;
        this.mFrames = 0;
    }
}

