package org.anddev.andengine.input.touch.detector;

import android.view.MotionEvent;
import org.anddev.andengine.input.touch.TouchEvent;

public class SurfaceScrollDetector
  extends ScrollDetector
{
  public SurfaceScrollDetector(float paramFloat, ScrollDetector.IScrollDetectorListener paramIScrollDetectorListener)
  {
    super(paramFloat, paramIScrollDetectorListener);
  }
  
  public SurfaceScrollDetector(ScrollDetector.IScrollDetectorListener paramIScrollDetectorListener)
  {
    super(paramIScrollDetectorListener);
  }
  
  protected float getX(TouchEvent paramTouchEvent)
  {
    return paramTouchEvent.getMotionEvent().getX();
  }
  
  protected float getY(TouchEvent paramTouchEvent)
  {
    return paramTouchEvent.getMotionEvent().getY();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.input.touch.detector.SurfaceScrollDetector
 * JD-Core Version:    0.7.0.1
 */