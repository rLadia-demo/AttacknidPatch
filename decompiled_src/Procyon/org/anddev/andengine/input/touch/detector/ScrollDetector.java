package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.*;

public class ScrollDetector extends BaseDetector
{
    private static final float TRIGGER_SCROLL_MINIMUM_DISTANCE_DEFAULT = 10.0f;
    private float mLastX;
    private float mLastY;
    private final IScrollDetectorListener mScrollDetectorListener;
    private float mTriggerScrollMinimumDistance;
    private boolean mTriggered;
    
    public ScrollDetector(final float mTriggerScrollMinimumDistance, final IScrollDetectorListener mScrollDetectorListener) {
        super();
        this.mTriggerScrollMinimumDistance = mTriggerScrollMinimumDistance;
        this.mScrollDetectorListener = mScrollDetectorListener;
    }
    
    public ScrollDetector(final IScrollDetectorListener scrollDetectorListener) {
        this(10.0f, scrollDetectorListener);
    }
    
    public float getTriggerScrollMinimumDistance() {
        return this.mTriggerScrollMinimumDistance;
    }
    
    protected float getX(final TouchEvent touchEvent) {
        return touchEvent.getX();
    }
    
    protected float getY(final TouchEvent touchEvent) {
        return touchEvent.getY();
    }
    
    public boolean onManagedTouchEvent(final TouchEvent touchEvent) {
        boolean mTriggered = true;
        final float x = this.getX(touchEvent);
        final float y = this.getY(touchEvent);
        switch (touchEvent.getAction()) {
            default: {
                mTriggered = false;
                break;
            }
            case 0: {
                this.mLastX = x;
                this.mLastY = y;
                this.mTriggered = false;
                return mTriggered;
            }
            case 1:
            case 2:
            case 3: {
                final float n = x - this.mLastX;
                final float n2 = y - this.mLastY;
                final float mTriggerScrollMinimumDistance = this.mTriggerScrollMinimumDistance;
                if (this.mTriggered || Math.abs(n) > mTriggerScrollMinimumDistance || Math.abs(n2) > mTriggerScrollMinimumDistance) {
                    this.mScrollDetectorListener.onScroll(this, touchEvent, n, n2);
                    this.mLastX = x;
                    this.mLastY = y;
                    return this.mTriggered = mTriggered;
                }
                break;
            }
        }
        return mTriggered;
    }
    
    public void setTriggerScrollMinimumDistance(final float mTriggerScrollMinimumDistance) {
        this.mTriggerScrollMinimumDistance = mTriggerScrollMinimumDistance;
    }
    
    public interface IScrollDetectorListener
    {
        void onScroll(ScrollDetector p0, TouchEvent p1, float p2, float p3);
    }
}
