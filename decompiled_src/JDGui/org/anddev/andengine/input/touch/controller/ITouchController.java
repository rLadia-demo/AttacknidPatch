package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.options.TouchOptions;
import org.anddev.andengine.input.touch.TouchEvent;

public abstract interface ITouchController
  extends IUpdateHandler
{
  public abstract void applyTouchOptions(TouchOptions paramTouchOptions);
  
  public abstract boolean onHandleMotionEvent(MotionEvent paramMotionEvent);
  
  public abstract void setTouchEventCallback(ITouchEventCallback paramITouchEventCallback);
  
  public static abstract interface ITouchEventCallback
  {
    public abstract boolean onTouchEvent(TouchEvent paramTouchEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.controller.ITouchController
 * JD-Core Version:    0.7.0.1
 */