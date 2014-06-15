/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.detector;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public class ClickDetector
extends BaseDetector {
    private static final long TRIGGER_CLICK_MAXIMUM_MILLISECONDS_DEFAULT = 200;
    private final IClickDetectorListener mClickDetectorListener;
    private long mDownTimeMilliseconds = Long.MIN_VALUE;
    private long mTriggerClickMaximumMilliseconds;

    public ClickDetector(long l, IClickDetectorListener iClickDetectorListener) {
        this.mTriggerClickMaximumMilliseconds = l;
        this.mClickDetectorListener = iClickDetectorListener;
    }

    public ClickDetector(IClickDetectorListener iClickDetectorListener) {
        this(200, iClickDetectorListener);
    }

    public long getTriggerClickMaximumMilliseconds() {
        return this.mTriggerClickMaximumMilliseconds;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onManagedTouchEvent(TouchEvent touchEvent) {
        boolean bl = true;
        switch (touchEvent.getAction()) {
            default: {
                return false;
            }
            case 0: {
                this.mDownTimeMilliseconds = touchEvent.getMotionEvent().getDownTime();
                return bl;
            }
            case 1: 
            case 3: 
        }
        if (touchEvent.getMotionEvent().getEventTime() - this.mDownTimeMilliseconds > this.mTriggerClickMaximumMilliseconds) return bl;
        this.mDownTimeMilliseconds = Long.MIN_VALUE;
        this.mClickDetectorListener.onClick(this, touchEvent);
        return bl;
    }

    public void setTriggerClickMaximumMilliseconds(long l) {
        this.mTriggerClickMaximumMilliseconds = l;
    }

    public interface IClickDetectorListener {
        public void onClick(ClickDetector var1, TouchEvent var2);
    }

}

