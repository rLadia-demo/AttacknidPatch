package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialIn
  implements IEaseFunction
{
  private static EaseExponentialIn INSTANCE;
  
  public static EaseExponentialIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseExponentialIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (paramFloat1 == 0.0F) {}
    for (double d = paramFloat3;; d = paramFloat4 * Math.pow(2.0D, 10.0F * (paramFloat1 / paramFloat2 - 1.0F)) + paramFloat3 - 0.001F * paramFloat4) {
      return (float)d;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseExponentialIn
 * JD-Core Version:    0.7.0.1
 */