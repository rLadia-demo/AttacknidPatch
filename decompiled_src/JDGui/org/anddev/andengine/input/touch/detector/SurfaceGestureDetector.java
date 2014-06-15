package org.anddev.andengine.input.touch.detector;

import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;

public abstract class SurfaceGestureDetector
  extends BaseDetector
{
  private static final float SWIPE_MIN_DISTANCE_DEFAULT = 120.0F;
  private final GestureDetector mGestureDetector;
  
  public SurfaceGestureDetector()
  {
    this(120.0F);
  }
  
  public SurfaceGestureDetector(float paramFloat)
  {
    this.mGestureDetector = new GestureDetector(new InnerOnGestureDetectorListener(paramFloat));
  }
  
  protected abstract boolean onDoubleTap();
  
  public boolean onManagedTouchEvent(TouchEvent paramTouchEvent)
  {
    return this.mGestureDetector.onTouchEvent(paramTouchEvent.getMotionEvent());
  }
  
  protected abstract boolean onSingleTap();
  
  protected abstract boolean onSwipeDown();
  
  protected abstract boolean onSwipeLeft();
  
  protected abstract boolean onSwipeRight();
  
  protected abstract boolean onSwipeUp();
  
  private class InnerOnGestureDetectorListener
    extends GestureDetector.SimpleOnGestureListener
  {
    private final float mSwipeMinDistance;
    
    public InnerOnGestureDetectorListener(float paramFloat)
    {
      this.mSwipeMinDistance = paramFloat;
    }
    
    public boolean onDoubleTap(MotionEvent paramMotionEvent)
    {
      return SurfaceGestureDetector.this.onDoubleTap();
    }
    
    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      float f = this.mSwipeMinDistance;
      int i;
      boolean bool2;
      if (Math.abs(paramFloat1) > Math.abs(paramFloat2))
      {
        i = 1;
        if (i == 0) {
          break label90;
        }
        if (paramMotionEvent1.getX() - paramMotionEvent2.getX() <= f) {
          break label60;
        }
        bool2 = SurfaceGestureDetector.this.onSwipeLeft();
      }
      label60:
      label90:
      boolean bool1;
      do
      {
        boolean bool3;
        do
        {
          return bool2;
          i = 0;
          break;
          bool3 = paramMotionEvent2.getX() - paramMotionEvent1.getX() < f;
          bool2 = false;
        } while (!bool3);
        return SurfaceGestureDetector.this.onSwipeRight();
        if (paramMotionEvent1.getY() - paramMotionEvent2.getY() > f) {
          return SurfaceGestureDetector.this.onSwipeUp();
        }
        bool1 = paramMotionEvent2.getY() - paramMotionEvent1.getY() < f;
        bool2 = false;
      } while (!bool1);
      return SurfaceGestureDetector.this.onSwipeDown();
    }
    
    public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
    {
      return SurfaceGestureDetector.this.onSingleTap();
    }
  }
  
  public static class SurfaceGestureDetectorAdapter
    extends SurfaceGestureDetector
  {
    protected boolean onDoubleTap()
    {
      return false;
    }
    
    protected boolean onSingleTap()
    {
      return false;
    }
    
    protected boolean onSwipeDown()
    {
      return false;
    }
    
    protected boolean onSwipeLeft()
    {
      return false;
    }
    
    protected boolean onSwipeRight()
    {
      return false;
    }
    
    protected boolean onSwipeUp()
    {
      return false;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.SurfaceGestureDetector
 * JD-Core Version:    0.7.0.1
 */