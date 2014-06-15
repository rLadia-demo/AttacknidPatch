/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.constants.TimeConstants;

public class FrameCountCrasher
implements IUpdateHandler,
TimeConstants {
    private final float[] mFrameLengths;
    private int mFramesLeft;

    public FrameCountCrasher(int n) {
        this.mFramesLeft = n;
        this.mFrameLengths = new float[n];
    }

    @Override
    public void onUpdate(float f) {
        this.mFramesLeft = -1 + this.mFramesLeft;
        float[] arrf = this.mFrameLengths;
        if (this.mFramesLeft >= 0) {
            arrf[this.mFramesLeft] = f;
            return;
        }
        int n = -1 + arrf.length;
        do {
            if (n < 0) {
                throw new RuntimeException();
            }
            Debug.d("Elapsed: " + arrf[n]);
            --n;
        } while (true);
    }

    @Override
    public void reset() {
    }
}

