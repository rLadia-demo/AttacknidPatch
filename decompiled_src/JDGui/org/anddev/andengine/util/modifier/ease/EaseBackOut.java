package org.anddev.andengine.util.modifier.ease;

public class EaseBackOut
  implements IEaseFunction
{
  private static EaseBackOut INSTANCE;
  
  public static EaseBackOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBackOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2 - 1.0F;
    return paramFloat3 + paramFloat4 * (1.0F + f * f * (1.70158F + 2.70158F * f));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBackOut
 * JD-Core Version:    0.7.0.1
 */