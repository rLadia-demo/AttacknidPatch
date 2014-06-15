package org.anddev.andengine.util.modifier.ease;

public class EaseCubicIn
  implements IEaseFunction
{
  private static EaseCubicIn INSTANCE;
  
  public static EaseCubicIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCubicIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2;
    return paramFloat3 + f * (f * (paramFloat4 * f));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCubicIn
 * JD-Core Version:    0.7.0.1
 */