/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public class ScrollDetector
extends BaseDetector {
    private static final float TRIGGER_SCROLL_MINIMUM_DISTANCE_DEFAULT = 10.0f;
    private float mLastX;
    private float mLastY;
    private final IScrollDetectorListener mScrollDetectorListener;
    private float mTriggerScrollMinimumDistance;
    private boolean mTriggered;

    public ScrollDetector(float f, IScrollDetectorListener iScrollDetectorListener) {
        this.mTriggerScrollMinimumDistance = f;
        this.mScrollDetectorListener = iScrollDetectorListener;
    }

    public ScrollDetector(IScrollDetectorListener iScrollDetectorListener) {
        this(10.0f, iScrollDetectorListener);
    }

    public float getTriggerScrollMinimumDistance() {
        return this.mTriggerScrollMinimumDistance;
    }

    protected float getX(TouchEvent touchEvent) {
        return touchEvent.getX();
    }

    protected float getY(TouchEvent touchEvent) {
        return touchEvent.getY();
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onManagedTouchEvent(TouchEvent touchEvent) {
        boolean bl = true;
        float f = this.getX(touchEvent);
        float f2 = this.getY(touchEvent);
        switch (touchEvent.getAction()) {
            default: {
                return false;
            }
            case 0: {
                this.mLastX = f;
                this.mLastY = f2;
                this.mTriggered = false;
                return bl;
            }
            case 1: 
            case 2: 
            case 3: 
        }
        float f3 = f - this.mLastX;
        float f4 = f2 - this.mLastY;
        float f5 = this.mTriggerScrollMinimumDistance;
        if (!(this.mTriggered || Math.abs(f3) > f5)) {
            if (Math.abs(f4) <= f5) return bl;
        }
        this.mScrollDetectorListener.onScroll(this, touchEvent, f3, f4);
        this.mLastX = f;
        this.mLastY = f2;
        this.mTriggered = bl;
        return bl;
    }

    public void setTriggerScrollMinimumDistance(float f) {
        this.mTriggerScrollMinimumDistance = f;
    }

    public interface IScrollDetectorListener {
        public void onScroll(ScrollDetector var1, TouchEvent var2, float var3, float var4);
    }

}

