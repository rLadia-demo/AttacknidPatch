package org.anddev.andengine.util.modifier.ease;

public class EaseQuartOut
  implements IEaseFunction
{
  private static EaseQuartOut INSTANCE;
  
  public static EaseQuartOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseQuartOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = -paramFloat4;
    float f2 = paramFloat1 / paramFloat2 - 1.0F;
    return paramFloat3 + f1 * (f2 * (f2 * (f2 * f2)) - 1.0F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseQuartOut
 * JD-Core Version:    0.7.0.1
 */