/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.view.MotionEvent
 */
package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.controller.ITouchController;
import org.anddev.andengine.util.pool.PoolItem;
import org.anddev.andengine.util.pool.RunnablePoolItem;
import org.anddev.andengine.util.pool.RunnablePoolUpdateHandler;

public abstract class BaseTouchController
implements ITouchController {
    private boolean mRunOnUpdateThread;
    private ITouchController.ITouchEventCallback mTouchEventCallback;
    private final RunnablePoolUpdateHandler<TouchEventRunnablePoolItem> mTouchEventRunnablePoolUpdateHandler;

    public BaseTouchController() {
        this.mTouchEventRunnablePoolUpdateHandler = new RunnablePoolUpdateHandler<TouchEventRunnablePoolItem>(){

            @Override
            protected TouchEventRunnablePoolItem onAllocatePoolItem() {
                return new TouchEventRunnablePoolItem();
            }
        };
    }

    @Override
    public void applyTouchOptions(TouchOptions touchOptions) {
        this.mRunOnUpdateThread = touchOptions.isRunOnUpdateThread();
    }

    protected boolean fireTouchEvent(float f, float f2, int n, int n2, MotionEvent motionEvent) {
        if (this.mRunOnUpdateThread) {
            TouchEvent touchEvent = TouchEvent.obtain(f, f2, n, n2, MotionEvent.obtain((MotionEvent)motionEvent));
            TouchEventRunnablePoolItem touchEventRunnablePoolItem = (TouchEventRunnablePoolItem)this.mTouchEventRunnablePoolUpdateHandler.obtainPoolItem();
            touchEventRunnablePoolItem.set(touchEvent);
            this.mTouchEventRunnablePoolUpdateHandler.postPoolItem((PoolItem)touchEventRunnablePoolItem);
            return true;
        }
        TouchEvent touchEvent = TouchEvent.obtain(f, f2, n, n2, motionEvent);
        boolean bl = this.mTouchEventCallback.onTouchEvent(touchEvent);
        touchEvent.recycle();
        return bl;
    }

    @Override
    public void onUpdate(float f) {
        if (!this.mRunOnUpdateThread) return;
        this.mTouchEventRunnablePoolUpdateHandler.onUpdate(f);
    }

    @Override
    public void reset() {
        if (!this.mRunOnUpdateThread) return;
        this.mTouchEventRunnablePoolUpdateHandler.reset();
    }

    @Override
    public void setTouchEventCallback(ITouchController.ITouchEventCallback iTouchEventCallback) {
        this.mTouchEventCallback = iTouchEventCallback;
    }

    class TouchEventRunnablePoolItem
    extends RunnablePoolItem {
        private TouchEvent mTouchEvent;

        TouchEventRunnablePoolItem() {
        }

        @Override
        protected void onRecycle() {
            super.onRecycle();
            TouchEvent touchEvent = this.mTouchEvent;
            touchEvent.getMotionEvent().recycle();
            touchEvent.recycle();
        }

        @Override
        public void run() {
            BaseTouchController.this.mTouchEventCallback.onTouchEvent(this.mTouchEvent);
        }

        public void set(TouchEvent touchEvent) {
            this.mTouchEvent = touchEvent;
        }
    }

}

