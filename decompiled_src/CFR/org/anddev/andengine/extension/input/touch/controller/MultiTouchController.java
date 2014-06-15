/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.extension.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.extension.input.touch.controller.MultiTouch;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchException;
import org.anddev.andengine.input.touch.controller.BaseTouchController;

public class MultiTouchController
extends BaseTouchController {
    public MultiTouchController() throws MultiTouchException {
        if (MultiTouch.isSupportedByAndroidVersion()) return;
        throw new MultiTouchException();
    }

    private int getPointerIndex(MotionEvent motionEvent) {
        return (65280 & motionEvent.getAction()) >> 8;
    }

    private boolean onHandleTouchAction(int n, MotionEvent motionEvent) {
        int n2 = this.getPointerIndex(motionEvent);
        int n3 = motionEvent.getPointerId(n2);
        return this.fireTouchEvent(motionEvent.getX(n2), motionEvent.getY(n2), n, n3, motionEvent);
    }

    /*
     * Enabled aggressive block sorting
     */
    private boolean onHandleTouchMove(MotionEvent motionEvent) {
        boolean bl = false;
        int n = -1 + motionEvent.getPointerCount();
        for (; n >= 0; --n) {
            int n2 = n;
            int n3 = motionEvent.getPointerId(n2);
            boolean bl2 = this.fireTouchEvent(motionEvent.getX(n2), motionEvent.getY(n2), 2, n3, motionEvent);
            if (!(bl || bl2)) {
                bl = false;
                continue;
            }
            bl = true;
        }
        return bl;
    }

    @Override
    public boolean onHandleMotionEvent(MotionEvent motionEvent) {
        int n = 255 & motionEvent.getAction();
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
            case 2: 
        }
        return this.onHandleTouchMove(motionEvent);
    }
}

