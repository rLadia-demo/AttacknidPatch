package org.anddev.andengine.util.modifier.ease;

public class EaseBounceOut
  implements IEaseFunction
{
  private static EaseBounceOut INSTANCE;
  
  public static EaseBounceOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBounceOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = paramFloat1 / paramFloat2;
    if (f1 < 0.3636363636363637D) {
      return paramFloat3 + paramFloat4 * (f1 * (7.5625F * f1));
    }
    if (f1 < 0.7272727272727273D)
    {
      float f4 = f1 - 0.5454546F;
      return paramFloat3 + paramFloat4 * (0.75F + f4 * (7.5625F * f4));
    }
    if (f1 < 0.9090909090909091D)
    {
      float f3 = f1 - 0.8181818F;
      return paramFloat3 + paramFloat4 * (0.9375F + f3 * (7.5625F * f3));
    }
    float f2 = f1 - 0.9545454F;
    return paramFloat3 + paramFloat4 * (0.984375F + f2 * (7.5625F * f2));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBounceOut
 * JD-Core Version:    0.7.0.1
 */