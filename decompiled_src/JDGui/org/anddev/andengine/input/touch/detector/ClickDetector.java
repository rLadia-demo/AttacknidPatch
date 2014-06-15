package org.anddev.andengine.input.touch.detector;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;

public class ClickDetector
  extends BaseDetector
{
  private static final long TRIGGER_CLICK_MAXIMUM_MILLISECONDS_DEFAULT = 200L;
  private final IClickDetectorListener mClickDetectorListener;
  private long mDownTimeMilliseconds = -9223372036854775808L;
  private long mTriggerClickMaximumMilliseconds;
  
  public ClickDetector(long paramLong, IClickDetectorListener paramIClickDetectorListener)
  {
    this.mTriggerClickMaximumMilliseconds = paramLong;
    this.mClickDetectorListener = paramIClickDetectorListener;
  }
  
  public ClickDetector(IClickDetectorListener paramIClickDetectorListener)
  {
    this(200L, paramIClickDetectorListener);
  }
  
  public long getTriggerClickMaximumMilliseconds()
  {
    return this.mTriggerClickMaximumMilliseconds;
  }
  
  public boolean onManagedTouchEvent(TouchEvent paramTouchEvent)
  {
    boolean bool = true;
    switch (paramTouchEvent.getAction())
    {
    case 2: 
    default: 
      bool = false;
    }
    do
    {
      return bool;
      this.mDownTimeMilliseconds = paramTouchEvent.getMotionEvent().getDownTime();
      return bool;
    } while (paramTouchEvent.getMotionEvent().getEventTime() - this.mDownTimeMilliseconds > this.mTriggerClickMaximumMilliseconds);
    this.mDownTimeMilliseconds = -9223372036854775808L;
    this.mClickDetectorListener.onClick(this, paramTouchEvent);
    return bool;
  }
  
  public void setTriggerClickMaximumMilliseconds(long paramLong)
  {
    this.mTriggerClickMaximumMilliseconds = paramLong;
  }
  
  public static abstract interface IClickDetectorListener
  {
    public abstract void onClick(ClickDetector paramClickDetector, TouchEvent paramTouchEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.ClickDetector
 * JD-Core Version:    0.7.0.1
 */