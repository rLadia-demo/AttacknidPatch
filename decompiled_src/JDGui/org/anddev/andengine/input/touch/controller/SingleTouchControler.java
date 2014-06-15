package org.anddev.andengine.input.touch.controller;

import android.view.MotionEvent;

public class SingleTouchControler
  extends BaseTouchController
{
  public boolean onHandleMotionEvent(MotionEvent paramMotionEvent)
  {
    return fireTouchEvent(paramMotionEvent.getX(), paramMotionEvent.getY(), paramMotionEvent.getAction(), 0, paramMotionEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.controller.SingleTouchControler
 * JD-Core Version:    0.7.0.1
 */