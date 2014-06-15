package org.anddev.andengine.util.modifier.ease;

public class EaseExponentialInOut
  implements IEaseFunction
{
  private static EaseExponentialInOut INSTANCE;
  
  public static EaseExponentialInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseExponentialInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (paramFloat1 == 0.0F) {
      return paramFloat3;
    }
    if (paramFloat1 == paramFloat2) {
      return paramFloat3 + paramFloat4;
    }
    float f = paramFloat1 / (paramFloat2 * 0.5F);
    if (f < 1.0F) {
      return (float)(paramFloat4 * 0.5F * Math.pow(2.0D, 10.0F * (f - 1.0F)) + paramFloat3);
    }
    return (float)(paramFloat4 * 0.5F * (2.0D + -Math.pow(2.0D, -10.0F * (f - 1.0F))) + paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseExponentialInOut
 * JD-Core Version:    0.7.0.1
 */