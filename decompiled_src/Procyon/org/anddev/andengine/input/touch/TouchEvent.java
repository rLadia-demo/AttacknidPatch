package org.anddev.andengine.input.touch;

import android.view.*;
import org.anddev.andengine.util.pool.*;

public class TouchEvent
{
    public static final int ACTION_CANCEL = 3;
    public static final int ACTION_DOWN = 0;
    public static final int ACTION_MOVE = 2;
    public static final int ACTION_OUTSIDE = 4;
    public static final int ACTION_UP = 1;
    private static final TouchEventPool TOUCHEVENT_POOL;
    protected int mAction;
    protected MotionEvent mMotionEvent;
    protected int mPointerID;
    protected float mX;
    protected float mY;
    
    static {
        TOUCHEVENT_POOL = new TouchEventPool(null);
    }
    
    public static TouchEvent obtain(final float n, final float n2, final int n3, final int n4, final MotionEvent motionEvent) {
        final TouchEvent touchEvent = TouchEvent.TOUCHEVENT_POOL.obtainPoolItem();
        touchEvent.set(n, n2, n3, n4, motionEvent);
        return touchEvent;
    }
    
    public static void recycle(final TouchEvent touchEvent) {
        TouchEvent.TOUCHEVENT_POOL.recyclePoolItem(touchEvent);
    }
    
    private void set(final float mx, final float my, final int mAction, final int mPointerID, final MotionEvent mMotionEvent) {
        this.mX = mx;
        this.mY = my;
        this.mAction = mAction;
        this.mPointerID = mPointerID;
        this.mMotionEvent = mMotionEvent;
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
    
    public void offset(final float n, final float n2) {
        this.mX += n;
        this.mY += n2;
    }
    
    public void recycle() {
        TouchEvent.TOUCHEVENT_POOL.recyclePoolItem(this);
    }
    
    public void set(final float mx, final float my) {
        this.mX = mx;
        this.mY = my;
    }
    
    private static final class TouchEventPool extends GenericPool<TouchEvent>
    {
        @Override
        protected TouchEvent onAllocatePoolItem() {
            return new TouchEvent();
        }
    }
}
