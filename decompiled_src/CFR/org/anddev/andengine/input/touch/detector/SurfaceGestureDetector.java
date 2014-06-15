/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.GestureDetector
 *  android.view.GestureDetector$OnGestureListener
 *  android.view.GestureDetector$SimpleOnGestureListener
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.detector;

import android.view.GestureDetector;
import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public abstract class SurfaceGestureDetector
extends BaseDetector {
    private static final float SWIPE_MIN_DISTANCE_DEFAULT = 120.0f;
    private final GestureDetector mGestureDetector;

    public SurfaceGestureDetector() {
        this(120.0f);
    }

    public SurfaceGestureDetector(float f) {
        this.mGestureDetector = new GestureDetector((GestureDetector.OnGestureListener)new InnerOnGestureDetectorListener(f));
    }

    protected abstract boolean onDoubleTap();

    @Override
    public boolean onManagedTouchEvent(TouchEvent touchEvent) {
        return this.mGestureDetector.onTouchEvent(touchEvent.getMotionEvent());
    }

    protected abstract boolean onSingleTap();

    protected abstract boolean onSwipeDown();

    protected abstract boolean onSwipeLeft();

    protected abstract boolean onSwipeRight();

    protected abstract boolean onSwipeUp();

    class InnerOnGestureDetectorListener
    extends GestureDetector.SimpleOnGestureListener {
        private final float mSwipeMinDistance;

        public InnerOnGestureDetectorListener(float f) {
            this.mSwipeMinDistance = f;
        }

        public boolean onDoubleTap(MotionEvent motionEvent) {
            return SurfaceGestureDetector.this.onDoubleTap();
        }

        /*
         * Enabled aggressive block sorting
         */
        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            float f3 = this.mSwipeMinDistance;
            boolean bl = Math.abs(f) > Math.abs(f2);
            if (bl) {
                if (motionEvent.getX() - motionEvent2.getX() > f3) {
                    return SurfaceGestureDetector.this.onSwipeLeft();
                }
                float f4 = motionEvent2.getX() - motionEvent.getX() FCMPL f3;
                bl2 = false;
                if (f4 <= 0) return bl2;
                return SurfaceGestureDetector.this.onSwipeRight();
            }
            if (motionEvent.getY() - motionEvent2.getY() > f3) {
                return SurfaceGestureDetector.this.onSwipeUp();
            }
            float f5 = motionEvent2.getY() - motionEvent.getY() FCMPL f3;
            boolean bl2 = false;
            if (f5 <= 0) return bl2;
            return SurfaceGestureDetector.this.onSwipeDown();
        }

        public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
            return SurfaceGestureDetector.this.onSingleTap();
        }
    }

    public static class SurfaceGestureDetectorAdapter
    extends SurfaceGestureDetector {
        @Override
        protected boolean onDoubleTap() {
            return false;
        }

        @Override
        protected boolean onSingleTap() {
            return false;
        }

        @Override
        protected boolean onSwipeDown() {
            return false;
        }

        @Override
        protected boolean onSwipeLeft() {
            return false;
        }

        @Override
        protected boolean onSwipeRight() {
            return false;
        }

        @Override
        protected boolean onSwipeUp() {
            return false;
        }
    }

}

