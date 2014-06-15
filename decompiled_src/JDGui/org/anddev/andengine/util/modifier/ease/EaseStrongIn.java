package org.anddev.andengine.util.modifier.ease;

public class EaseStrongIn
  implements IEaseFunction
{
  private static EaseStrongIn INSTANCE;
  
  public static EaseStrongIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseStrongIn();
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
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseStrongIn
 * JD-Core Version:    0.7.0.1
 */