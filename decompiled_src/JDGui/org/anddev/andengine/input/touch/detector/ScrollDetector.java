package org.anddev.andengine.input.touch.detector;

import org.anddev.andengine.input.touch.TouchEvent;

public class ScrollDetector
  extends BaseDetector
{
  private static final float TRIGGER_SCROLL_MINIMUM_DISTANCE_DEFAULT = 10.0F;
  private float mLastX;
  private float mLastY;
  private final IScrollDetectorListener mScrollDetectorListener;
  private float mTriggerScrollMinimumDistance;
  private boolean mTriggered;
  
  public ScrollDetector(float paramFloat, IScrollDetectorListener paramIScrollDetectorListener)
  {
    this.mTriggerScrollMinimumDistance = paramFloat;
    this.mScrollDetectorListener = paramIScrollDetectorListener;
  }
  
  public ScrollDetector(IScrollDetectorListener paramIScrollDetectorListener)
  {
    this(10.0F, paramIScrollDetectorListener);
  }
  
  public float getTriggerScrollMinimumDistance()
  {
    return this.mTriggerScrollMinimumDistance;
  }
  
  protected float getX(TouchEvent paramTouchEvent)
  {
    return paramTouchEvent.getX();
  }
  
  protected float getY(TouchEvent paramTouchEvent)
  {
    return paramTouchEvent.getY();
  }
  
  public boolean onManagedTouchEvent(TouchEvent paramTouchEvent)
  {
    boolean bool = true;
    float f1 = getX(paramTouchEvent);
    float f2 = getY(paramTouchEvent);
    switch (paramTouchEvent.getAction())
    {
    default: 
      bool = false;
    }
    float f3;
    float f4;
    float f5;
    do
    {
      return bool;
      this.mLastX = f1;
      this.mLastY = f2;
      this.mTriggered = false;
      return bool;
      f3 = f1 - this.mLastX;
      f4 = f2 - this.mLastY;
      f5 = this.mTriggerScrollMinimumDistance;
    } while ((!this.mTriggered) && (Math.abs(f3) <= f5) && (Math.abs(f4) <= f5));
    this.mScrollDetectorListener.onScroll(this, paramTouchEvent, f3, f4);
    this.mLastX = f1;
    this.mLastY = f2;
    this.mTriggered = bool;
    return bool;
  }
  
  public void setTriggerScrollMinimumDistance(float paramFloat)
  {
    this.mTriggerScrollMinimumDistance = paramFloat;
  }
  
  public static abstract interface IScrollDetectorListener
  {
    public abstract void onScroll(ScrollDetector paramScrollDetector, TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.ScrollDetector
 * JD-Core Version:    0.7.0.1
 */