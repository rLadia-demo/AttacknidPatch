package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.util.pool.RunnablePoolItem;
import org.anddev.andengine.util.pool.RunnablePoolUpdateHandler;

public abstract class BaseTouchController
  implements ITouchController
{
  private boolean mRunOnUpdateThread;
  private ITouchController.ITouchEventCallback mTouchEventCallback;
  private final RunnablePoolUpdateHandler<TouchEventRunnablePoolItem> mTouchEventRunnablePoolUpdateHandler = new RunnablePoolUpdateHandler()
  {
    protected BaseTouchController.TouchEventRunnablePoolItem onAllocatePoolItem()
    {
      return new BaseTouchController.TouchEventRunnablePoolItem(BaseTouchController.this);
    }
  };
  
  public void applyTouchOptions(TouchOptions paramTouchOptions)
  {
    this.mRunOnUpdateThread = paramTouchOptions.isRunOnUpdateThread();
  }
  
  protected boolean fireTouchEvent(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, MotionEvent paramMotionEvent)
  {
    if (this.mRunOnUpdateThread)
    {
      TouchEvent localTouchEvent2 = TouchEvent.obtain(paramFloat1, paramFloat2, paramInt1, paramInt2, MotionEvent.obtain(paramMotionEvent));
      TouchEventRunnablePoolItem localTouchEventRunnablePoolItem = (TouchEventRunnablePoolItem)this.mTouchEventRunnablePoolUpdateHandler.obtainPoolItem();
      localTouchEventRunnablePoolItem.set(localTouchEvent2);
      this.mTouchEventRunnablePoolUpdateHandler.postPoolItem(localTouchEventRunnablePoolItem);
      return true;
    }
    TouchEvent localTouchEvent1 = TouchEvent.obtain(paramFloat1, paramFloat2, paramInt1, paramInt2, paramMotionEvent);
    boolean bool = this.mTouchEventCallback.onTouchEvent(localTouchEvent1);
    localTouchEvent1.recycle();
    return bool;
  }
  
  public void onUpdate(float paramFloat)
  {
    if (this.mRunOnUpdateThread) {
      this.mTouchEventRunnablePoolUpdateHandler.onUpdate(paramFloat);
    }
  }
  
  public void reset()
  {
    if (this.mRunOnUpdateThread) {
      this.mTouchEventRunnablePoolUpdateHandler.reset();
    }
  }
  
  public void setTouchEventCallback(ITouchController.ITouchEventCallback paramITouchEventCallback)
  {
    this.mTouchEventCallback = paramITouchEventCallback;
  }
  
  class TouchEventRunnablePoolItem
    extends RunnablePoolItem
  {
    private TouchEvent mTouchEvent;
    
    TouchEventRunnablePoolItem() {}
    
    protected void onRecycle()
    {
      super.onRecycle();
      TouchEvent localTouchEvent = this.mTouchEvent;
      localTouchEvent.getMotionEvent().recycle();
      localTouchEvent.recycle();
    }
    
    public void run()
    {
      BaseTouchController.this.mTouchEventCallback.onTouchEvent(this.mTouchEvent);
    }
    
    public void set(TouchEvent paramTouchEvent)
    {
      this.mTouchEvent = paramTouchEvent;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.controller.BaseTouchController
 * JD-Core Version:    0.7.0.1
 */