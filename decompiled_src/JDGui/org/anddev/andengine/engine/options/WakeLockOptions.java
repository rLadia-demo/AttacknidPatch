package org.anddev.andengine.engine.options;

public enum WakeLockOptions
{
  SCREEN_DIM(6),  SCREEN_BRIGHT(10),  FULL(26);
  
  private final int mFlag;
  
  private WakeLockOptions(int paramInt)
  {
    this.mFlag = paramInt;
  }
  
  public int getFlag()
  {
    return this.mFlag;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.WakeLockOptions
 * JD-Core Version:    0.7.0.1
 */