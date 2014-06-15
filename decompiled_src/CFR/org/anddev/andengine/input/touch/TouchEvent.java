/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch;

import android.view.MotionEvent;
import org.anddev.andengine.util.pool.GenericPool;

public class TouchEvent {
    public static final int ACTION_CANCEL = 3;
    public static final int ACTION_DOWN = 0;
    public static final int ACTION_MOVE = 2;
    public static final int ACTION_OUTSIDE = 4;
    public static final int ACTION_UP = 1;
    private static final TouchEventPool TOUCHEVENT_POOL = new TouchEventPool(null);
    protected int mAction;
    protected MotionEvent mMotionEvent;
    protected int mPointerID;
    protected float mX;
    protected float mY;

    public static TouchEvent obtain(float f, float f2, int n, int n2, MotionEvent motionEvent) {
        TouchEvent touchEvent = (TouchEvent)TouchEvent.TOUCHEVENT_POOL.obtainPoolItem();
        touchEvent.set(f, f2, n, n2, motionEvent);
        return touchEvent;
    }

    public static void recycle(TouchEvent touchEvent) {
        TouchEvent.TOUCHEVENT_POOL.recyclePoolItem((Object)touchEvent);
    }

    private void set(float f, float f2, int n, int n2, MotionEvent motionEvent) {
        this.mX = f;
        this.mY = f2;
        this.mAction = n;
        this.mPointerID = n2;
        this.mMotionEvent = motionEvent;
    }

    public int getAction() {
        return this.mAction;
    }

    public MotionEvent getMotionEvent() {
        return this.mMotionEvent;
    }

    public int getPointerID() {
        return this.mPointerID;
    }

    public float getX() {
        return this.mX;
    }

    public float getY() {
        return this.mY;
    }

    public void offset(float f, float f2) {
        this.mX = f + this.mX;
        this.mY = f2 + this.mY;
    }

    public void recycle() {
        TouchEvent.TOUCHEVENT_POOL.recyclePoolItem((Object)this);
    }

    public void set(float f, float f2) {
        this.mX = f;
        this.mY = f2;
    }

    static final class TouchEventPool
    extends GenericPool<TouchEvent> {
        private TouchEventPool() {
        }

        /* synthetic */ TouchEventPool(TouchEventPool touchEventPool) {
            this();
        }

        @Override
        protected TouchEvent onAllocatePoolItem() {
            return new TouchEvent();
        }
    }

}

