package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.engine.handler.timer.*;
import android.os.*;
import org.anddev.andengine.input.touch.*;
import android.view.*;

public class HoldDetector extends BaseDetector implements IUpdateHandler
{
    private static final float TIME_BETWEEN_UPDATES_DEFAULT = 0.1f;
    private static final float TRIGGER_HOLD_MAXIMUM_DISTANCE_DEFAULT = 10.0f;
    private static final long TRIGGER_HOLD_MINIMUM_MILLISECONDS_DEFAULT = 200L;
    private long mDownTimeMilliseconds;
    private float mDownX;
    private float mDownY;
    private final IHoldDetectorListener mHoldDetectorListener;
    private float mHoldX;
    private float mHoldY;
    private boolean mMaximumDistanceExceeded;
    private final TimerHandler mTimerHandler;
    private float mTriggerHoldMaximumDistance;
    private long mTriggerHoldMinimumMilliseconds;
    private boolean mTriggerOnHold;
    private boolean mTriggerOnHoldFinished;
    
    public HoldDetector(final long mTriggerHoldMinimumMilliseconds, final float mTriggerHoldMaximumDistance, final float n, final IHoldDetectorListener mHoldDetectorListener) {
        super();
        this.mDownTimeMilliseconds = Long.MIN_VALUE;
        this.mMaximumDistanceExceeded = false;
        this.mTriggerOnHold = false;
        this.mTriggerOnHoldFinished = false;
        this.mTriggerHoldMinimumMilliseconds = mTriggerHoldMinimumMilliseconds;
        this.mTriggerHoldMaximumDistance = mTriggerHoldMaximumDistance;
        this.mHoldDetectorListener = mHoldDetectorListener;
        this.mTimerHandler = new TimerHandler(n, true, new ITimerCallback() {
            @Override
            public void onTimePassed(final TimerHandler timerHandler) {
                HoldDetector.this.fireListener();
            }
        });
    }
    
    public HoldDetector(final IHoldDetectorListener holdDetectorListener) {
        this(200L, 10.0f, 0.1f, holdDetectorListener);
    }
    
    protected void fireListener() {
        if (this.mTriggerOnHoldFinished) {
            this.mHoldDetectorListener.onHoldFinished(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
            this.mTriggerOnHoldFinished = false;
            this.mTriggerOnHold = false;
        }
        else if (this.mTriggerOnHold) {
            this.mHoldDetectorListener.onHold(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
        }
    }
    
    public float getTriggerHoldMaximumDistance() {
        return this.mTriggerHoldMaximumDistance;
    }
    
    public long getTriggerHoldMinimumMilliseconds() {
        return this.mTriggerHoldMinimumMilliseconds;
    }
    
    public boolean isHolding() {
        return this.mTriggerOnHold;
    }
    
    public boolean onManagedTouchEvent(final TouchEvent touchEvent) {
        boolean b = true;
        final MotionEvent motionEvent = touchEvent.getMotionEvent();
        this.mHoldX = touchEvent.getX();
        this.mHoldY = touchEvent.getY();
        switch (touchEvent.getAction()) {
            default: {
                b = false;
                break;
            }
            case 0: {
                this.mDownTimeMilliseconds = motionEvent.getDownTime();
                this.mDownX = motionEvent.getX();
                this.mDownY = motionEvent.getY();
                this.mMaximumDistanceExceeded = false;
                return b;
            }
            case 2: {
                final long eventTime = motionEvent.getEventTime();
                final float mTriggerHoldMaximumDistance = this.mTriggerHoldMaximumDistance;
                while (true) {
                    Label_0195: {
                        if (this.mMaximumDistanceExceeded || Math.abs(this.mDownX - motionEvent.getX()) > mTriggerHoldMaximumDistance) {
                            break Label_0195;
                        }
                        final float n = fcmpl(Math.abs(this.mDownY - motionEvent.getY()), mTriggerHoldMaximumDistance);
                        final boolean mMaximumDistanceExceeded = false;
                        if (n > 0) {
                            break Label_0195;
                        }
                        this.mMaximumDistanceExceeded = mMaximumDistanceExceeded;
                        if ((this.mTriggerOnHold || !this.mMaximumDistanceExceeded) && eventTime - this.mDownTimeMilliseconds >= this.mTriggerHoldMinimumMilliseconds) {
                            return this.mTriggerOnHold = b;
                        }
                        break;
                    }
                    final boolean mMaximumDistanceExceeded = b;
                    continue;
                }
            }
            case 1:
            case 3: {
                final long eventTime2 = motionEvent.getEventTime();
                final float mTriggerHoldMaximumDistance2 = this.mTriggerHoldMaximumDistance;
                while (true) {
                    Label_0305: {
                        if (this.mMaximumDistanceExceeded || Math.abs(this.mDownX - motionEvent.getX()) > mTriggerHoldMaximumDistance2) {
                            break Label_0305;
                        }
                        final float n2 = fcmpl(Math.abs(this.mDownY - motionEvent.getY()), mTriggerHoldMaximumDistance2);
                        final boolean mMaximumDistanceExceeded2 = false;
                        if (n2 > 0) {
                            break Label_0305;
                        }
                        this.mMaximumDistanceExceeded = mMaximumDistanceExceeded2;
                        if ((this.mTriggerOnHold || !this.mMaximumDistanceExceeded) && eventTime2 - this.mDownTimeMilliseconds >= this.mTriggerHoldMinimumMilliseconds) {
                            return this.mTriggerOnHoldFinished = b;
                        }
                        break;
                    }
                    final boolean mMaximumDistanceExceeded2 = b;
                    continue;
                }
            }
        }
        return b;
    }
    
    @Override
    public void onUpdate(final float n) {
        this.mTimerHandler.onUpdate(n);
    }
    
    @Override
    public void reset() {
        this.mTimerHandler.reset();
    }
    
    public void setTriggerHoldMaximumDistance(final float mTriggerHoldMaximumDistance) {
        this.mTriggerHoldMaximumDistance = mTriggerHoldMaximumDistance;
    }
    
    public void setTriggerHoldMinimumMilliseconds(final long mTriggerHoldMinimumMilliseconds) {
        this.mTriggerHoldMinimumMilliseconds = mTriggerHoldMinimumMilliseconds;
    }
    
    public interface IHoldDetectorListener
    {
        void onHold(HoldDetector p0, long p1, float p2, float p3);
        
        void onHoldFinished(HoldDetector p0, long p1, float p2, float p3);
    }
}
