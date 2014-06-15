package org.anddev.andengine.extension.input.touch.detector;

import android.util.FloatMath;
import android.view.MotionEvent;
import org.anddev.andengine.extension.input.touch.controller.MultiTouch;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchException;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.BaseDetector;

public class PinchZoomDetector
  extends BaseDetector
{
  private static final float TRIGGER_PINCHZOOM_MINIMUM_DISTANCE_DEFAULT = 10.0F;
  private float mCurrentDistance;
  private float mInitialDistance;
  private final IPinchZoomDetectorListener mPinchZoomDetectorListener;
  private boolean mPinchZooming;
  
  public PinchZoomDetector(IPinchZoomDetectorListener paramIPinchZoomDetectorListener)
    throws MultiTouchException
  {
    if (!MultiTouch.isSupportedByAndroidVersion()) {
      throw new MultiTouchException();
    }
    this.mPinchZoomDetectorListener = paramIPinchZoomDetectorListener;
  }
  
  private float calculatePointerDistance(MotionEvent paramMotionEvent)
  {
    float f1 = paramMotionEvent.getX(0) - paramMotionEvent.getX(1);
    float f2 = paramMotionEvent.getY(0) - paramMotionEvent.getY(1);
    return FloatMath.sqrt(f1 * f1 + f2 * f2);
  }
  
  private float getZoomFactor()
  {
    return this.mCurrentDistance / this.mInitialDistance;
  }
  
  public boolean isZooming()
  {
    return this.mPinchZooming;
  }
  
  public boolean onManagedTouchEvent(TouchEvent paramTouchEvent)
  {
    MotionEvent localMotionEvent = paramTouchEvent.getMotionEvent();
    switch (0xFF & localMotionEvent.getAction())
    {
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              return true;
            } while (this.mPinchZooming);
            this.mInitialDistance = calculatePointerDistance(localMotionEvent);
          } while (this.mInitialDistance <= 10.0F);
          this.mPinchZooming = true;
          this.mPinchZoomDetectorListener.onPinchZoomStarted(this, paramTouchEvent);
          return true;
        } while (!this.mPinchZooming);
        this.mPinchZooming = false;
        this.mPinchZoomDetectorListener.onPinchZoomFinished(this, paramTouchEvent, getZoomFactor());
        return true;
      } while (!this.mPinchZooming);
      this.mCurrentDistance = calculatePointerDistance(localMotionEvent);
    } while (this.mCurrentDistance <= 10.0F);
    this.mPinchZoomDetectorListener.onPinchZoom(this, paramTouchEvent, getZoomFactor());
    return true;
  }
  
  public static abstract interface IPinchZoomDetectorListener
  {
    public abstract void onPinchZoom(PinchZoomDetector paramPinchZoomDetector, TouchEvent paramTouchEvent, float paramFloat);
    
    public abstract void onPinchZoomFinished(PinchZoomDetector paramPinchZoomDetector, TouchEvent paramTouchEvent, float paramFloat);
    
    public abstract void onPinchZoomStarted(PinchZoomDetector paramPinchZoomDetector, TouchEvent paramTouchEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.input.touch.detector.PinchZoomDetector
 * JD-Core Version:    0.7.0.1
 */