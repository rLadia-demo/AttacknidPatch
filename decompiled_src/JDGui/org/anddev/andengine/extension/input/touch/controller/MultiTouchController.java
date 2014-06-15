package org.anddev.andengine.extension.input.touch.controller;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.controller.BaseTouchController;

public class MultiTouchController
  extends BaseTouchController
{
  public MultiTouchController()
    throws MultiTouchException
  {
    if (!MultiTouch.isSupportedByAndroidVersion()) {
      throw new MultiTouchException();
    }
  }
  
  private int getPointerIndex(MotionEvent paramMotionEvent)
  {
    return (0xFF00 & paramMotionEvent.getAction()) >> 8;
  }
  
  private boolean onHandleTouchAction(int paramInt, MotionEvent paramMotionEvent)
  {
    int i = getPointerIndex(paramMotionEvent);
    int j = paramMotionEvent.getPointerId(i);
    return fireTouchEvent(paramMotionEvent.getX(i), paramMotionEvent.getY(i), paramInt, j, paramMotionEvent);
  }
  
  private boolean onHandleTouchMove(MotionEvent paramMotionEvent)
  {
    boolean bool1 = false;
    int i = -1 + paramMotionEvent.getPointerCount();
    if (i < 0) {
      return bool1;
    }
    int j = i;
    int k = paramMotionEvent.getPointerId(j);
    boolean bool2 = fireTouchEvent(paramMotionEvent.getX(j), paramMotionEvent.getY(j), 2, k, paramMotionEvent);
    if ((!bool1) && (!bool2)) {}
    for (bool1 = false;; bool1 = true)
    {
      i--;
      break;
    }
  }
  
  public boolean onHandleMotionEvent(MotionEvent paramMotionEvent)
  {
    int i = 0xFF & paramMotionEvent.getAction();
    switch (i)
    {
    default: 
      throw new IllegalArgumentException("Invalid Action detected: " + i);
    case 0: 
    case 5: 
      return onHandleTouchAction(0, paramMotionEvent);
    case 1: 
    case 6: 
      return onHandleTouchAction(1, paramMotionEvent);
    case 3: 
    case 4: 
      return onHandleTouchAction(i, paramMotionEvent);
    }
    return onHandleTouchMove(paramMotionEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.input.touch.controller.MultiTouchController
 * JD-Core Version:    0.7.0.1
 */