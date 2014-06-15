/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.IUpdateHandler;

public class FPSCounter
implements IUpdateHandler {
    protected int mFrames;
    protected float mSecondsElapsed;

    public float getFPS() {
        return (float)this.mFrames / this.mSecondsElapsed;
    }

    @Override
    public void onUpdate(float f) {
        this.mFrames = 1 + this.mFrames;
        this.mSecondsElapsed = f + this.mSecondsElapsed;
    }

    @Override
    public void reset() {
        this.mFrames = 0;
        this.mSecondsElapsed = 0.0f;
    }
}

