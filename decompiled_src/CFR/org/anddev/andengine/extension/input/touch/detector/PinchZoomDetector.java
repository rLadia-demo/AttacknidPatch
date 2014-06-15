/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 *  android.view.MotionEvent
 */
package org.anddev.andengine.extension.input.touch.detector;

import android.util.FloatMath;
import android.view.MotionEvent;
import org.anddev.andengine.extension.input.touch.controller.MultiTouch;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchException;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public class PinchZoomDetector
extends BaseDetector {
    private static final float TRIGGER_PINCHZOOM_MINIMUM_DISTANCE_DEFAULT = 10.0f;
    private float mCurrentDistance;
    private float mInitialDistance;
    private final IPinchZoomDetectorListener mPinchZoomDetectorListener;
    private boolean mPinchZooming;

    public PinchZoomDetector(IPinchZoomDetectorListener iPinchZoomDetectorListener) throws MultiTouchException {
        if (!MultiTouch.isSupportedByAndroidVersion()) {
            throw new MultiTouchException();
        }
        this.mPinchZoomDetectorListener = iPinchZoomDetectorListener;
    }

    private float calculatePointerDistance(MotionEvent motionEvent) {
        float f = motionEvent.getX(0) - motionEvent.getX(1);
        float f2 = motionEvent.getY(0) - motionEvent.getY(1);
        return FloatMath.sqrt((float)(f * f + f2 * f2));
    }

    private float getZoomFactor() {
        return this.mCurrentDistance / this.mInitialDistance;
    }

    public boolean isZooming() {
        return this.mPinchZooming;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onManagedTouchEvent(TouchEvent touchEvent) {
        MotionEvent motionEvent = touchEvent.getMotionEvent();
        switch (255 & motionEvent.getAction()) {
            default: {
                return true;
            }
            case 5: {
                if (this.mPinchZooming) return true;
                this.mInitialDistance = this.calculatePointerDistance(motionEvent);
                if (this.mInitialDistance <= 10.0f) return true;
                this.mPinchZooming = true;
                this.mPinchZoomDetectorListener.onPinchZoomStarted(this, touchEvent);
                return true;
            }
            case 1: 
            case 6: {
                if (!this.mPinchZooming) return true;
                this.mPinchZooming = false;
                this.mPinchZoomDetectorListener.onPinchZoomFinished(this, touchEvent, this.getZoomFactor());
                return true;
            }
            case 2: 
        }
        if (!this.mPinchZooming) return true;
        this.mCurrentDistance = this.calculatePointerDistance(motionEvent);
        if (this.mCurrentDistance <= 10.0f) return true;
        this.mPinchZoomDetectorListener.onPinchZoom(this, touchEvent, this.getZoomFactor());
        return true;
    }

    public interface IPinchZoomDetectorListener {
        public void onPinchZoom(PinchZoomDetector var1, TouchEvent var2, float var3);

        public void onPinchZoomFinished(PinchZoomDetector var1, TouchEvent var2, float var3);

        public void onPinchZoomStarted(PinchZoomDetector var1, TouchEvent var2);
    }

}

