package org.anddev.andengine.input.touch.detector;

import android.os.SystemClock;
import android.view.MotionEvent;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.input.touch.TouchEvent;

public class HoldDetector
  extends BaseDetector
  implements IUpdateHandler
{
  private static final float TIME_BETWEEN_UPDATES_DEFAULT = 0.1F;
  private static final float TRIGGER_HOLD_MAXIMUM_DISTANCE_DEFAULT = 10.0F;
  private static final long TRIGGER_HOLD_MINIMUM_MILLISECONDS_DEFAULT = 200L;
  private long mDownTimeMilliseconds = -9223372036854775808L;
  private float mDownX;
  private float mDownY;
  private final IHoldDetectorListener mHoldDetectorListener;
  private float mHoldX;
  private float mHoldY;
  private boolean mMaximumDistanceExceeded = false;
  private final TimerHandler mTimerHandler;
  private float mTriggerHoldMaximumDistance;
  private long mTriggerHoldMinimumMilliseconds;
  private boolean mTriggerOnHold = false;
  private boolean mTriggerOnHoldFinished = false;
  
  public HoldDetector(long paramLong, float paramFloat1, float paramFloat2, IHoldDetectorListener paramIHoldDetectorListener)
  {
    this.mTriggerHoldMinimumMilliseconds = paramLong;
    this.mTriggerHoldMaximumDistance = paramFloat1;
    this.mHoldDetectorListener = paramIHoldDetectorListener;
    this.mTimerHandler = new TimerHandler(paramFloat2, true, new ITimerCallback()
    {
      public void onTimePassed(TimerHandler paramAnonymousTimerHandler)
      {
        HoldDetector.this.fireListener();
      }
    });
  }
  
  public HoldDetector(IHoldDetectorListener paramIHoldDetectorListener)
  {
    this(200L, 10.0F, 0.1F, paramIHoldDetectorListener);
  }
  
  protected void fireListener()
  {
    if (this.mTriggerOnHoldFinished)
    {
      this.mHoldDetectorListener.onHoldFinished(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
      this.mTriggerOnHoldFinished = false;
      this.mTriggerOnHold = false;
    }
    while (!this.mTriggerOnHold) {
      return;
    }
    this.mHoldDetectorListener.onHold(this, SystemClock.uptimeMillis() - this.mDownTimeMilliseconds, this.mHoldX, this.mHoldY);
  }
  
  public float getTriggerHoldMaximumDistance()
  {
    return this.mTriggerHoldMaximumDistance;
  }
  
  public long getTriggerHoldMinimumMilliseconds()
  {
    return this.mTriggerHoldMinimumMilliseconds;
  }
  
  public boolean isHolding()
  {
    return this.mTriggerOnHold;
  }
  
  public boolean onManagedTouchEvent(TouchEvent paramTouchEvent)
  {
    boolean bool1 = true;
    MotionEvent localMotionEvent = paramTouchEvent.getMotionEvent();
    this.mHoldX = paramTouchEvent.getX();
    this.mHoldY = paramTouchEvent.getY();
    switch (paramTouchEvent.getAction())
    {
    default: 
      bool1 = false;
      return bool1;
    case 0: 
      this.mDownTimeMilliseconds = localMotionEvent.getDownTime();
      this.mDownX = localMotionEvent.getX();
      this.mDownY = localMotionEvent.getY();
      this.mMaximumDistanceExceeded = false;
      return bool1;
    case 2: 
      long l2 = localMotionEvent.getEventTime();
      float f2 = this.mTriggerHoldMaximumDistance;
      boolean bool4;
      if ((!this.mMaximumDistanceExceeded) && (Math.abs(this.mDownX - localMotionEvent.getX()) <= f2))
      {
        boolean bool5 = Math.abs(this.mDownY - localMotionEvent.getY()) < f2;
        bool4 = false;
        if (bool5) {}
      }
      for (;;)
      {
        this.mMaximumDistanceExceeded = bool4;
        if (((!this.mTriggerOnHold) && (this.mMaximumDistanceExceeded)) || (l2 - this.mDownTimeMilliseconds < this.mTriggerHoldMinimumMilliseconds)) {
          break;
        }
        this.mTriggerOnHold = bool1;
        return bool1;
        bool4 = bool1;
      }
    }
    long l1 = localMotionEvent.getEventTime();
    float f1 = this.mTriggerHoldMaximumDistance;
    boolean bool2;
    if ((!this.mMaximumDistanceExceeded) && (Math.abs(this.mDownX - localMotionEvent.getX()) <= f1))
    {
      boolean bool3 = Math.abs(this.mDownY - localMotionEvent.getY()) < f1;
      bool2 = false;
      if (bool3) {}
    }
    for (;;)
    {
      this.mMaximumDistanceExceeded = bool2;
      if (((!this.mTriggerOnHold) && (this.mMaximumDistanceExceeded)) || (l1 - this.mDownTimeMilliseconds < this.mTriggerHoldMinimumMilliseconds)) {
        break;
      }
      this.mTriggerOnHoldFinished = bool1;
      return bool1;
      bool2 = bool1;
    }
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mTimerHandler.onUpdate(paramFloat);
  }
  
  public void reset()
  {
    this.mTimerHandler.reset();
  }
  
  public void setTriggerHoldMaximumDistance(float paramFloat)
  {
    this.mTriggerHoldMaximumDistance = paramFloat;
  }
  
  public void setTriggerHoldMinimumMilliseconds(long paramLong)
  {
    this.mTriggerHoldMinimumMilliseconds = paramLong;
  }
  
  public static abstract interface IHoldDetectorListener
  {
    public abstract void onHold(HoldDetector paramHoldDetector, long paramLong, float paramFloat1, float paramFloat2);
    
    public abstract void onHoldFinished(HoldDetector paramHoldDetector, long paramLong, float paramFloat1, float paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.HoldDetector
 * JD-Core Version:    0.7.0.1
 */