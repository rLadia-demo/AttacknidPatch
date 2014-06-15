/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.IUpdateHandler;

public class FrameCounter
implements IUpdateHandler {
    private int mFrames;

    public int getFrames() {
        return this.mFrames;
    }

    @Override
    public void onUpdate(float f) {
        this.mFrames = 1 + this.mFrames;
    }

    @Override
    public void reset() {
        this.mFrames = 0;
    }
}

