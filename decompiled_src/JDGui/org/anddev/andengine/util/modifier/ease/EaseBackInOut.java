package org.anddev.andengine.util.modifier.ease;

public class EaseBackInOut
  implements IEaseFunction
{
  private static EaseBackInOut INSTANCE;
  
  public static EaseBackInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBackInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = paramFloat1 / (paramFloat2 * 0.5F);
    if (f1 < 1.0F)
    {
      float f6 = paramFloat4 * 0.5F;
      float f7 = f1 * f1;
      float f8 = 1.70158F * 1.525F;
      return paramFloat3 + f6 * (f7 * (f1 * (1.0F + f8) - f8));
    }
    float f2 = paramFloat4 / 2.0F;
    float f3 = f1 - 2.0F;
    float f4 = f3 * f3;
    float f5 = 1.70158F * 1.525F;
    return paramFloat3 + f2 * (2.0F + f4 * (f5 + f3 * (1.0F + f5)));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBackInOut
 * JD-Core Version:    0.7.0.1
 */