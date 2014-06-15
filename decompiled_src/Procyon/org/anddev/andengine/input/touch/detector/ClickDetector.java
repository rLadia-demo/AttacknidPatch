package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.*;

public class ClickDetector extends BaseDetector
{
    private static final long TRIGGER_CLICK_MAXIMUM_MILLISECONDS_DEFAULT = 200L;
    private final IClickDetectorListener mClickDetectorListener;
    private long mDownTimeMilliseconds;
    private long mTriggerClickMaximumMilliseconds;
    
    public ClickDetector(final long mTriggerClickMaximumMilliseconds, final IClickDetectorListener mClickDetectorListener) {
        super();
        this.mDownTimeMilliseconds = Long.MIN_VALUE;
        this.mTriggerClickMaximumMilliseconds = mTriggerClickMaximumMilliseconds;
        this.mClickDetectorListener = mClickDetectorListener;
    }
    
    public ClickDetector(final IClickDetectorListener clickDetectorListener) {
        this(200L, clickDetectorListener);
    }
    
    public long getTriggerClickMaximumMilliseconds() {
        return this.mTriggerClickMaximumMilliseconds;
    }
    
    public boolean onManagedTouchEvent(final TouchEvent touchEvent) {
        boolean b = true;
        switch (touchEvent.getAction()) {
            default: {
                b = false;
                break;
            }
            case 0: {
                this.mDownTimeMilliseconds = touchEvent.getMotionEvent().getDownTime();
                return b;
            }
            case 1:
            case 3: {
                if (touchEvent.getMotionEvent().getEventTime() - this.mDownTimeMilliseconds <= this.mTriggerClickMaximumMilliseconds) {
                    this.mDownTimeMilliseconds = Long.MIN_VALUE;
                    this.mClickDetectorListener.onClick(this, touchEvent);
                    return b;
                }
                break;
            }
        }
        return b;
    }
    
    public void setTriggerClickMaximumMilliseconds(final long mTriggerClickMaximumMilliseconds) {
        this.mTriggerClickMaximumMilliseconds = mTriggerClickMaximumMilliseconds;
    }
    
    public interface IClickDetectorListener
    {
        void onClick(ClickDetector p0, TouchEvent p1);
    }
}
