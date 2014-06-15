package org.anddev.andengine.entity.util;

import org.anddev.andengine.util.Debug;

public class FPSLogger
  extends AverageFPSCounter
{
  protected float mLongestFrame = 1.4E-45F;
  protected float mShortestFrame = 3.4028235E+38F;
  
  public FPSLogger() {}
  
  public FPSLogger(float paramFloat)
  {
    super(paramFloat);
  }
  
  protected void onHandleAverageDurationElapsed(float paramFloat)
  {
    onLogFPS();
    this.mLongestFrame = 1.4E-45F;
    this.mShortestFrame = 3.4028235E+38F;
  }
  
  protected void onLogFPS()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Float.valueOf(this.mFrames / this.mSecondsElapsed);
    arrayOfObject[1] = Float.valueOf(1000.0F * this.mShortestFrame);
    arrayOfObject[2] = Float.valueOf(1000.0F * this.mLongestFrame);
    Debug.d(String.format("FPS: %.2f (MIN: %.0f ms | MAX: %.0f ms)", arrayOfObject));
  }
  
  public void onUpdate(float paramFloat)
  {
    super.onUpdate(paramFloat);
    this.mShortestFrame = Math.min(this.mShortestFrame, paramFloat);
    this.mLongestFrame = Math.max(this.mLongestFrame, paramFloat);
  }
  
  public void reset()
  {
    super.reset();
    this.mShortestFrame = 3.4028235E+38F;
    this.mLongestFrame = 1.4E-45F;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.util.FPSLogger
 * JD-Core Version:    0.7.0.1
 */