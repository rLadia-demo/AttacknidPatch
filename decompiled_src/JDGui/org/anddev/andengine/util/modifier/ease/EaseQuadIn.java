package org.anddev.andengine.util.modifier.ease;

public class EaseQuadIn
  implements IEaseFunction
{
  private static EaseQuadIn INSTANCE;
  
  public static EaseQuadIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseQuadIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2;
    return paramFloat3 + f * (paramFloat4 * f);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseQuadIn
 * JD-Core Version:    0.7.0.1
 */