package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.*;
import android.view.*;

public abstract class SurfaceGestureDetector extends BaseDetector
{
    private static final float SWIPE_MIN_DISTANCE_DEFAULT = 120.0f;
    private final GestureDetector mGestureDetector;
    
    public SurfaceGestureDetector() {
        this(120.0f);
    }
    
    public SurfaceGestureDetector(final float n) {
        super();
        this.mGestureDetector = new GestureDetector((GestureDetector$OnGestureListener)new InnerOnGestureDetectorListener(n));
    }
    
    protected abstract boolean onDoubleTap();
    
    public boolean onManagedTouchEvent(final TouchEvent touchEvent) {
        return this.mGestureDetector.onTouchEvent(touchEvent.getMotionEvent());
    }
    
    protected abstract boolean onSingleTap();
    
    protected abstract boolean onSwipeDown();
    
    protected abstract boolean onSwipeLeft();
    
    protected abstract boolean onSwipeRight();
    
    protected abstract boolean onSwipeUp();
    
    private class InnerOnGestureDetectorListener extends GestureDetector$SimpleOnGestureListener
    {
        private final float mSwipeMinDistance;
        
        public InnerOnGestureDetectorListener(final float mSwipeMinDistance) {
            super();
            this.mSwipeMinDistance = mSwipeMinDistance;
        }
        
        public boolean onDoubleTap(final MotionEvent motionEvent) {
            return SurfaceGestureDetector.this.onDoubleTap();
        }
        
        public boolean onFling(final MotionEvent motionEvent, final MotionEvent motionEvent2, final float n, final float n2) {
            final float mSwipeMinDistance = this.mSwipeMinDistance;
            int n3;
            if (Math.abs(n) > Math.abs(n2)) {
                n3 = 1;
            }
            else {
                n3 = 0;
            }
            boolean onSwipeLeft;
            if (n3 != 0) {
                if (motionEvent.getX() - motionEvent2.getX() > mSwipeMinDistance) {
                    onSwipeLeft = SurfaceGestureDetector.this.onSwipeLeft();
                }
                else {
                    final float n4 = fcmpl(motionEvent2.getX() - motionEvent.getX(), mSwipeMinDistance);
                    onSwipeLeft = false;
                    if (n4 > 0) {
                        return SurfaceGestureDetector.this.onSwipeRight();
                    }
                }
            }
            else {
                if (motionEvent.getY() - motionEvent2.getY() > mSwipeMinDistance) {
                    return SurfaceGestureDetector.this.onSwipeUp();
                }
                final float n5 = fcmpl(motionEvent2.getY() - motionEvent.getY(), mSwipeMinDistance);
                onSwipeLeft = false;
                if (n5 > 0) {
                    return SurfaceGestureDetector.this.onSwipeDown();
                }
            }
            return onSwipeLeft;
        }
        
        public boolean onSingleTapConfirmed(final MotionEvent motionEvent) {
            return SurfaceGestureDetector.this.onSingleTap();
        }
    }
    
    public static class SurfaceGestureDetectorAdapter extends SurfaceGestureDetector
    {
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
