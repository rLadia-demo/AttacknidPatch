package org.anddev.andengine.engine.handler.timer;

import org.anddev.andengine.engine.handler.*;

public class TimerHandler implements IUpdateHandler
{
    private boolean mAutoReset;
    private boolean mCallbackTriggered;
    private final ITimerCallback mTimerCallback;
    private float mTimerSeconds;
    private float mTimerSecondsElapsed;
    
    public TimerHandler(final float n, final ITimerCallback timerCallback) {
        this(n, false, timerCallback);
    }
    
    public TimerHandler(final float mTimerSeconds, final boolean mAutoReset, final ITimerCallback mTimerCallback) {
        super();
        this.mCallbackTriggered = false;
        this.mTimerSeconds = mTimerSeconds;
        this.mAutoReset = mAutoReset;
        this.mTimerCallback = mTimerCallback;
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
    
    @Override
    public void onUpdate(final float n) {
        if (this.mAutoReset) {
            this.mTimerSecondsElapsed += n;
            while (this.mTimerSecondsElapsed >= this.mTimerSeconds) {
                this.mTimerSecondsElapsed -= this.mTimerSeconds;
                this.mTimerCallback.onTimePassed(this);
            }
        }
        else if (!this.mCallbackTriggered) {
            this.mTimerSecondsElapsed += n;
            if (this.mTimerSecondsElapsed >= this.mTimerSeconds) {
                this.mCallbackTriggered = true;
                this.mTimerCallback.onTimePassed(this);
            }
        }
    }
    
    @Override
    public void reset() {
        this.mCallbackTriggered = false;
        this.mTimerSecondsElapsed = 0.0f;
    }
    
    public void setAutoReset(final boolean mAutoReset) {
        this.mAutoReset = mAutoReset;
    }
    
    public void setTimerSeconds(final float mTimerSeconds) {
        this.mTimerSeconds = mTimerSeconds;
    }
}
