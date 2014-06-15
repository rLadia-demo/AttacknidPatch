package org.anddev.andengine.engine;

import org.anddev.andengine.engine.options.EngineOptions;

public class FixedStepEngine
  extends Engine
{
  private long mSecondsElapsedAccumulator;
  private final long mStepLength;
  
  public FixedStepEngine(EngineOptions paramEngineOptions, int paramInt)
  {
    super(paramEngineOptions);
    this.mStepLength = (1000000000L / paramInt);
  }
  
  public void onUpdate(long paramLong)
    throws InterruptedException
  {
    this.mSecondsElapsedAccumulator = (paramLong + this.mSecondsElapsedAccumulator);
    long l = this.mStepLength;
    for (;;)
    {
      if (this.mSecondsElapsedAccumulator < l) {
        return;
      }
      super.onUpdate(l);
      this.mSecondsElapsedAccumulator -= l;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.FixedStepEngine
 * JD-Core Version:    0.7.0.1
 */