package org.anddev.andengine.input.touch;

import android.view.MotionEvent;
import org.anddev.andengine.util.pool.GenericPool;

public class TouchEvent
{
  public static final int ACTION_CANCEL = 3;
  public static final int ACTION_DOWN = 0;
  public static final int ACTION_MOVE = 2;
  public static final int ACTION_OUTSIDE = 4;
  public static final int ACTION_UP = 1;
  private static final TouchEventPool TOUCHEVENT_POOL = new TouchEventPool(null);
  protected int mAction;
  protected MotionEvent mMotionEvent;
  protected int mPointerID;
  protected float mX;
  protected float mY;
  
  public static TouchEvent obtain(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, MotionEvent paramMotionEvent)
  {
    TouchEvent localTouchEvent = (TouchEvent)TOUCHEVENT_POOL.obtainPoolItem();
    localTouchEvent.set(paramFloat1, paramFloat2, paramInt1, paramInt2, paramMotionEvent);
    return localTouchEvent;
  }
  
  public static void recycle(TouchEvent paramTouchEvent)
  {
    TOUCHEVENT_POOL.recyclePoolItem(paramTouchEvent);
  }
  
  private void set(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, MotionEvent paramMotionEvent)
  {
    this.mX = paramFloat1;
    this.mY = paramFloat2;
    this.mAction = paramInt1;
    this.mPointerID = paramInt2;
    this.mMotionEvent = paramMotionEvent;
  }
  
  public int getAction()
  {
    return this.mAction;
  }
  
  public MotionEvent getMotionEvent()
  {
    return this.mMotionEvent;
  }
  
  public int getPointerID()
  {
    return this.mPointerID;
  }
  
  public float getX()
  {
    return this.mX;
  }
  
  public float getY()
  {
    return this.mY;
  }
  
  public void offset(float paramFloat1, float paramFloat2)
  {
    this.mX = (paramFloat1 + this.mX);
    this.mY = (paramFloat2 + this.mY);
  }
  
  public void recycle()
  {
    TOUCHEVENT_POOL.recyclePoolItem(this);
  }
  
  public void set(float paramFloat1, float paramFloat2)
  {
    this.mX = paramFloat1;
    this.mY = paramFloat2;
  }
  
  private static final class TouchEventPool
    extends GenericPool<TouchEvent>
  {
    protected TouchEvent onAllocatePoolItem()
    {
      return new TouchEvent();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.TouchEvent
 * JD-Core Version:    0.7.0.1
 */