package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialOut
  implements IEaseFunction
{
  private static EaseExponentialOut INSTANCE;
  
  public static EaseExponentialOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseExponentialOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (paramFloat1 == paramFloat2) {}
    for (double d = paramFloat3 + paramFloat4;; d = paramFloat4 * (1.0D + -Math.pow(2.0D, -10.0F * paramFloat1 / paramFloat2)) + paramFloat3) {
      return (float)d;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseExponentialOut
 * JD-Core Version:    0.7.0.1
 */