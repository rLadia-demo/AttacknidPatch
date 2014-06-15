package org.anddev.andengine.util.modifier.ease;

public class EaseCubicInOut
  implements IEaseFunction
{
  private static EaseCubicInOut INSTANCE;
  
  public static EaseCubicInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCubicInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = paramFloat1 / (paramFloat2 * 0.5F);
    if (f1 < 1.0F) {
      return paramFloat3 + f1 * (f1 * (f1 * (paramFloat4 * 0.5F)));
    }
    float f2 = paramFloat4 * 0.5F;
    float f3 = f1 - 2.0F;
    return paramFloat3 + f2 * (2.0F + f3 * (f3 * f3));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCubicInOut
 * JD-Core Version:    0.7.0.1
 */