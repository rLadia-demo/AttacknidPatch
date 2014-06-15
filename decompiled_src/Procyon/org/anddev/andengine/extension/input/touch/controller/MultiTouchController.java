package org.anddev.andengine.extension.input.touch.controller;

import org.anddev.andengine.input.touch.controller.*;
import android.view.*;

public class MultiTouchController extends BaseTouchController
{
    public MultiTouchController() throws MultiTouchException {
        super();
        if (!MultiTouch.isSupportedByAndroidVersion()) {
            throw new MultiTouchException();
        }
    }
    
    private int getPointerIndex(final MotionEvent motionEvent) {
        return (0xFF00 & motionEvent.getAction()) >> 8;
    }
    
    private boolean onHandleTouchAction(final int n, final MotionEvent motionEvent) {
        final int pointerIndex = this.getPointerIndex(motionEvent);
        return this.fireTouchEvent(motionEvent.getX(pointerIndex), motionEvent.getY(pointerIndex), n, motionEvent.getPointerId(pointerIndex), motionEvent);
    }
    
    private boolean onHandleTouchMove(final MotionEvent motionEvent) {
        boolean b = false;
        for (int i = -1 + motionEvent.getPointerCount(); i >= 0; --i) {
            final int n = i;
            final boolean fireTouchEvent = this.fireTouchEvent(motionEvent.getX(n), motionEvent.getY(n), 2, motionEvent.getPointerId(n), motionEvent);
            b = (b || fireTouchEvent);
        }
        return b;
    }
    
    @Override
    public boolean onHandleMotionEvent(final MotionEvent motionEvent) {
        final int n = 0xFF & motionEvent.getAction();
        switch (n) {
            default: {
                throw new IllegalArgumentException("Invalid Action detected: " + n);
            }
            case 0:
            case 5: {
                return this.onHandleTouchAction(0, motionEvent);
            }
            case 1:
            case 6: {
                return this.onHandleTouchAction(1, motionEvent);
            }
            case 3:
            case 4: {
                return this.onHandleTouchAction(n, motionEvent);
            }
            case 2: {
                return this.onHandleTouchMove(motionEvent);
            }
        }
    }
}
