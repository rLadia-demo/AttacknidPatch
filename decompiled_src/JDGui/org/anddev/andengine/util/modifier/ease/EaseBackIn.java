package org.anddev.andengine.util.modifier.ease;

public class EaseBackIn
  implements IEaseFunction
{
  private static EaseBackIn INSTANCE;
  
  public static EaseBackIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBackIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2;
    return paramFloat3 + f * (paramFloat4 * f) * (2.70158F * f - 1.70158F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBackIn
 * JD-Core Version:    0.7.0.1
 */