package org.anddev.andengine.input.touch.controller;

import org.anddev.andengine.util.pool.*;
import org.anddev.andengine.engine.options.*;
import android.view.*;
import org.anddev.andengine.input.touch.*;

public abstract class BaseTouchController implements ITouchController
{
    private boolean mRunOnUpdateThread;
    private ITouchEventCallback mTouchEventCallback;
    private final RunnablePoolUpdateHandler<TouchEventRunnablePoolItem> mTouchEventRunnablePoolUpdateHandler;
    
    public BaseTouchController() {
        super();
        this.mTouchEventRunnablePoolUpdateHandler = new RunnablePoolUpdateHandler<TouchEventRunnablePoolItem>() {
            @Override
            protected TouchEventRunnablePoolItem onAllocatePoolItem() {
                return new TouchEventRunnablePoolItem();
            }
        };
    }
    
    @Override
    public void applyTouchOptions(final TouchOptions touchOptions) {
        this.mRunOnUpdateThread = touchOptions.isRunOnUpdateThread();
    }
    
    protected boolean fireTouchEvent(final float n, final float n2, final int n3, final int n4, final MotionEvent motionEvent) {
        if (this.mRunOnUpdateThread) {
            final TouchEvent obtain = TouchEvent.obtain(n, n2, n3, n4, MotionEvent.obtain(motionEvent));
            final TouchEventRunnablePoolItem touchEventRunnablePoolItem = this.mTouchEventRunnablePoolUpdateHandler.obtainPoolItem();
            touchEventRunnablePoolItem.set(obtain);
            this.mTouchEventRunnablePoolUpdateHandler.postPoolItem(touchEventRunnablePoolItem);
            return true;
        }
        final TouchEvent obtain2 = TouchEvent.obtain(n, n2, n3, n4, motionEvent);
        final boolean onTouchEvent = this.mTouchEventCallback.onTouchEvent(obtain2);
        obtain2.recycle();
        return onTouchEvent;
    }
    
    @Override
    public void onUpdate(final float n) {
        if (this.mRunOnUpdateThread) {
            this.mTouchEventRunnablePoolUpdateHandler.onUpdate(n);
        }
    }
    
    @Override
    public void reset() {
        if (this.mRunOnUpdateThread) {
            this.mTouchEventRunnablePoolUpdateHandler.reset();
        }
    }
    
    @Override
    public void setTouchEventCallback(final ITouchEventCallback mTouchEventCallback) {
        this.mTouchEventCallback = mTouchEventCallback;
    }
    
    class TouchEventRunnablePoolItem extends RunnablePoolItem
    {
        private TouchEvent mTouchEvent;
        
        @Override
        protected void onRecycle() {
            super.onRecycle();
            final TouchEvent mTouchEvent = this.mTouchEvent;
            mTouchEvent.getMotionEvent().recycle();
            mTouchEvent.recycle();
        }
        
        @Override
        public void run() {
            BaseTouchController.this.mTouchEventCallback.onTouchEvent(this.mTouchEvent);
        }
        
        public void set(final TouchEvent mTouchEvent) {
            this.mTouchEvent = mTouchEvent;
        }
    }
}
