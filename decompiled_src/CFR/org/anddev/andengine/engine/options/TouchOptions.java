/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.options;

public class TouchOptions {
    private boolean mRunOnUpdateThread;

    public TouchOptions disableRunOnUpdateThread() {
        return this.setRunOnUpdateThread(false);
    }

    public TouchOptions enableRunOnUpdateThread() {
        return this.setRunOnUpdateThread(true);
    }

    public boolean isRunOnUpdateThread() {
        return this.mRunOnUpdateThread;
    }

    public TouchOptions setRunOnUpdateThread(boolean bl) {
        this.mRunOnUpdateThread = bl;
        return this;
    }
}

