package org.anddev.andengine.util.modifier.ease;

public class EaseCubicOut
  implements IEaseFunction
{
  private static EaseCubicOut INSTANCE;
  
  public static EaseCubicOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCubicOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2 - 1.0F;
    return paramFloat3 + paramFloat4 * (1.0F + f * (f * f));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCubicOut
 * JD-Core Version:    0.7.0.1
 */