package org.anddev.andengine.extension.input.touch.detector;

import org.anddev.andengine.input.touch.detector.*;
import org.anddev.andengine.extension.input.touch.controller.*;
import android.view.*;
import android.util.*;
import org.anddev.andengine.input.touch.*;

public class PinchZoomDetector extends BaseDetector
{
    private static final float TRIGGER_PINCHZOOM_MINIMUM_DISTANCE_DEFAULT = 10.0f;
    private float mCurrentDistance;
    private float mInitialDistance;
    private final IPinchZoomDetectorListener mPinchZoomDetectorListener;
    private boolean mPinchZooming;
    
    public PinchZoomDetector(final IPinchZoomDetectorListener mPinchZoomDetectorListener) throws MultiTouchException {
        super();
        if (!MultiTouch.isSupportedByAndroidVersion()) {
            throw new MultiTouchException();
        }
        this.mPinchZoomDetectorListener = mPinchZoomDetectorListener;
    }
    
    private float calculatePointerDistance(final MotionEvent motionEvent) {
        final float n = motionEvent.getX(0) - motionEvent.getX(1);
        final float n2 = motionEvent.getY(0) - motionEvent.getY(1);
        return FloatMath.sqrt(n * n + n2 * n2);
    }
    
    private float getZoomFactor() {
        return this.mCurrentDistance / this.mInitialDistance;
    }
    
    public boolean isZooming() {
        return this.mPinchZooming;
    }
    
    public boolean onManagedTouchEvent(final TouchEvent touchEvent) {
        final MotionEvent motionEvent = touchEvent.getMotionEvent();
        switch (0xFF & motionEvent.getAction()) {
            case 5: {
                if (this.mPinchZooming) {
                    break;
                }
                this.mInitialDistance = this.calculatePointerDistance(motionEvent);
                if (this.mInitialDistance > 10.0f) {
                    this.mPinchZooming = true;
                    this.mPinchZoomDetectorListener.onPinchZoomStarted(this, touchEvent);
                    return true;
                }
                break;
            }
            case 1:
            case 6: {
                if (this.mPinchZooming) {
                    this.mPinchZooming = false;
                    this.mPinchZoomDetectorListener.onPinchZoomFinished(this, touchEvent, this.getZoomFactor());
                    return true;
                }
                break;
            }
            case 2: {
                if (!this.mPinchZooming) {
                    break;
                }
                this.mCurrentDistance = this.calculatePointerDistance(motionEvent);
                if (this.mCurrentDistance > 10.0f) {
                    this.mPinchZoomDetectorListener.onPinchZoom(this, touchEvent, this.getZoomFactor());
                    return true;
                }
                break;
            }
        }
        return true;
    }
    
    public interface IPinchZoomDetectorListener
    {
        void onPinchZoom(PinchZoomDetector p0, TouchEvent p1, float p2);
        
        void onPinchZoomFinished(PinchZoomDetector p0, TouchEvent p1, float p2);
        
        void onPinchZoomStarted(PinchZoomDetector p0, TouchEvent p1);
    }
}
