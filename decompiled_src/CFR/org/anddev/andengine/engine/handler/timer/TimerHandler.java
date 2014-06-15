/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.handler.timer;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;

public class TimerHandler
implements IUpdateHandler {
    private boolean mAutoReset;
    private boolean mCallbackTriggered = false;
    private final ITimerCallback mTimerCallback;
    private float mTimerSeconds;
    private float mTimerSecondsElapsed;

    public TimerHandler(float f, ITimerCallback iTimerCallback) {
        this(f, false, iTimerCallback);
    }

    public TimerHandler(float f, boolean bl, ITimerCallback iTimerCallback) {
        this.mTimerSeconds = f;
        this.mAutoReset = bl;
        this.mTimerCallback = iTimerCallback;
    }

    public float getTimerSeconds() {
        return this.mTimerSeconds;
    }

    public float getTimerSecondsElapsed() {
        return this.mTimerSecondsElapsed;
    }

    public boolean isAutoReset() {
        return this.mAutoReset;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void onUpdate(float f) {
        if (!this.mAutoReset) {
            if (this.mCallbackTriggered) return;
            this.mTimerSecondsElapsed = f + this.mTimerSecondsElapsed;
            if (this.mTimerSecondsElapsed < this.mTimerSeconds) return;
            this.mCallbackTriggered = true;
            this.mTimerCallback.onTimePassed(this);
            return;
        }
        this.mTimerSecondsElapsed = f + this.mTimerSecondsElapsed;
        while (this.mTimerSecondsElapsed >= this.mTimerSeconds) {
            this.mTimerSecondsElapsed-=this.mTimerSeconds;
            this.mTimerCallback.onTimePassed(this);
        }
    }

    @Override
    public void reset() {
        this.mCallbackTriggered = false;
        this.mTimerSecondsElapsed = 0.0f;
    }

    public void setAutoReset(boolean bl) {
        this.mAutoReset = bl;
    }

    public void setTimerSeconds(float f) {
        this.mTimerSeconds = f;
    }
}

