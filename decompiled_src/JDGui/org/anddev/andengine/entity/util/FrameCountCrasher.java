package org.anddev.andengine.entity.util;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.constants.TimeConstants;

public class FrameCountCrasher
  implements IUpdateHandler, TimeConstants
{
  private final float[] mFrameLengths;
  private int mFramesLeft;
  
  public FrameCountCrasher(int paramInt)
  {
    this.mFramesLeft = paramInt;
    this.mFrameLengths = new float[paramInt];
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mFramesLeft = (-1 + this.mFramesLeft);
    float[] arrayOfFloat = this.mFrameLengths;
    if (this.mFramesLeft >= 0)
    {
      arrayOfFloat[this.mFramesLeft] = paramFloat;
      return;
    }
    for (int i = -1 + arrayOfFloat.length;; i--)
    {
      if (i < 0) {
        throw new RuntimeException();
      }
      Debug.d("Elapsed: " + arrayOfFloat[i]);
    }
  }
  
  public void reset() {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.util.FrameCountCrasher
 * JD-Core Version:    0.7.0.1
 */