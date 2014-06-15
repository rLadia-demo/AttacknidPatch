/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.input.touch.TouchEvent;

public abstract class BaseDetector
implements Scene.IOnSceneTouchListener {
    private boolean mEnabled = true;

    public boolean isEnabled() {
        return this.mEnabled;
    }

    protected abstract boolean onManagedTouchEvent(TouchEvent var1);

    @Override
    public boolean onSceneTouchEvent(Scene scene, TouchEvent touchEvent) {
        return this.onTouchEvent(touchEvent);
    }

    public final boolean onTouchEvent(TouchEvent touchEvent) {
        if (!this.mEnabled) return false;
        return this.onManagedTouchEvent(touchEvent);
    }

    public void setEnabled(boolean bl) {
        this.mEnabled = bl;
    }
}

