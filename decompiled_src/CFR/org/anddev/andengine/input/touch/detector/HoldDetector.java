/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.os.SystemClock
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.detector;

import android.os.SystemClock;
import android.view.MotionEvent;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public class HoldDetector
extends BaseDetector
implements IUpdateHandler {
    private static final float TIME_BETWEEN_UPDATES_DEFAULT = 0.1f;
    private static final float TRIGGER_HOLD_MAXIMUM_DISTANCE_DEFAULT = 10.0f;
    private static final long TRIGGER_HOLD_MINIMUM_MILLISECONDS_DEFAULT = 200;
    private long mDownTimeMilliseconds = Long.MIN_VALUE;
    private float mDownX;
    private float mDownY;
    private final IHoldDetectorListener mHoldDetectorListener;
    private float mHoldX;
    private float mHoldY;
    private boolean mMaximumDistanceExceeded = false;
    private final TimerHandler mTimerHandler;
    private float mTriggerHoldMaximumDistance;
    private long mTriggerHoldMinimumMilliseconds;
    private boolean mTriggerOnHold = false;
    private boolean mTriggerOnHoldFinished = false;

    public HoldDetector(long l, float f, float f2, IHoldDetectorListener iHoldDetectorListener) {
        this.mTriggerHoldMinimumMilliseconds = l;
        this.mTriggerHoldMaximumDistance = f;
        this.mHoldDetectorListener = iHoldDetectorListener;
        this.mTimerHandler = new TimerHandler(f2, true, new ITimerCallback(){

            @Override
            public void onTimePassed(TimerHandler timerHandler) {
                HoldDetector.this.fireListener();
            }
        });
    }

    public HoldDetector(IHoldDetectorListener iHoldDetectorListener) {
        this(200, 10.0f, 0.1f, iHoldDetectorListener);
    }

    /*
     * Enabled aggressive block sorting
     */
    protected void fireListener() {
        if (this.mTriggerOnHoldFinished) {
            this.mHoldDetectorListener.onHoldFinished(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
            this.mTriggerOnHoldFinished = false;
            this.mTriggerOnHold = false;
            return;
        }
        if (!this.mTriggerOnHold) return;
        this.mHoldDetectorListener.onHold(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
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

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onManagedTouchEvent(TouchEvent var1_1) {
        var2_2 = true;
        var3_3 = var1_1.getMotionEvent();
        this.mHoldX = var1_1.getX();
        this.mHoldY = var1_1.getY();
        switch (var1_1.getAction()) {
            default: {
                return false;
            }
            case 0: {
                this.mDownTimeMilliseconds = var3_3.getDownTime();
                this.mDownX = var3_3.getX();
                this.mDownY = var3_3.getY();
                this.mMaximumDistanceExceeded = false;
                return var2_2;
            }
            case 2: {
                var9_4 = var3_3.getEventTime();
                var11_5 = this.mTriggerHoldMaximumDistance;
                ** if (this.mMaximumDistanceExceeded || Math.abs((float)(this.mDownX - var3_3.getX())) > var11_5) goto lbl-1000
lbl18: // 1 sources:
                var13_6 = Math.abs(this.mDownY - var3_3.getY()) FCMPL var11_5;
                var12_7 = false;
                if (var13_6 > 0) lbl-1000: // 2 sources:
                {
                    var12_7 = var2_2;
                }
                this.mMaximumDistanceExceeded = var12_7;
                if (!this.mTriggerOnHold) {
                    if (this.mMaximumDistanceExceeded != false) return var2_2;
                }
                if (var9_4 - this.mDownTimeMilliseconds < this.mTriggerHoldMinimumMilliseconds) return var2_2;
                this.mTriggerOnHold = var2_2;
                return var2_2;
            }
            case 1: 
            case 3: 
        }
        var4_8 = var3_3.getEventTime();
        var6_9 = this.mTriggerHoldMaximumDistance;
        ** if (this.mMaximumDistanceExceeded || Math.abs((float)(this.mDownX - var3_3.getX())) > var6_9) goto lbl-1000
lbl32: // 1 sources:
        var8_10 = Math.abs(this.mDownY - var3_3.getY()) FCMPL var6_9;
        var7_11 = false;
        if (var8_10 > 0) lbl-1000: // 2 sources:
        {
            var7_11 = var2_2;
        }
        this.mMaximumDistanceExceeded = var7_11;
        if (!this.mTriggerOnHold) {
            if (this.mMaximumDistanceExceeded != false) return var2_2;
        }
        if (var4_8 - this.mDownTimeMilliseconds < this.mTriggerHoldMinimumMilliseconds) return var2_2;
        this.mTriggerOnHoldFinished = var2_2;
        return var2_2;
    }

    @Override
    public void onUpdate(float f) {
        this.mTimerHandler.onUpdate(f);
    }

    @Override
    public void reset() {
        this.mTimerHandler.reset();
    }

    public void setTriggerHoldMaximumDistance(float f) {
        this.mTriggerHoldMaximumDistance = f;
    }

    public void setTriggerHoldMinimumMilliseconds(long l) {
        this.mTriggerHoldMinimumMilliseconds = l;
    }

    public interface IHoldDetectorListener {
        public void onHold(HoldDetector var1, long var2, float var4, float var5);

        public void onHoldFinished(HoldDetector var1, long var2, float var4, float var5);
    }

}

