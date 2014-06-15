package org.anddev.andengine.entity.util;

import org.anddev.andengine.util.constants.TimeConstants;

public abstract class AverageFPSCounter
  extends FPSCounter
  implements TimeConstants
{
  private static final float AVERAGE_DURATION_DEFAULT = 5.0F;
  protected final float mAverageDuration;
  
  public AverageFPSCounter()
  {
    this(5.0F);
  }
  
  public AverageFPSCounter(float paramFloat)
  {
    this.mAverageDuration = paramFloat;
  }
  
  protected abstract void onHandleAverageDurationElapsed(float paramFloat);
  
  public void onUpdate(float paramFloat)
  {
    super.onUpdate(paramFloat);
    if (this.mSecondsElapsed > this.mAverageDuration)
    {
      onHandleAverageDurationElapsed(getFPS());
      this.mSecondsElapsed -= this.mAverageDuration;
      this.mFrames = 0;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.util.AverageFPSCounter
 * JD-Core Version:    0.7.0.1
 */