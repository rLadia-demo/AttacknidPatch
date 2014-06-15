package org.anddev.andengine.util.modifier.ease;

public class EaseQuintIn
  implements IEaseFunction
{
  private static EaseQuintIn INSTANCE;
  
  public static EaseQuintIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseQuintIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2;
    return paramFloat3 + f * (f * (f * (f * (paramFloat4 * f))));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseQuintIn
 * JD-Core Version:    0.7.0.1
 */