package org.anddev.andengine.util.modifier.ease;

public class EaseStrongOut
  implements IEaseFunction
{
  private static EaseStrongOut INSTANCE;
  
  public static EaseStrongOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseStrongOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2 - 1.0F;
    return paramFloat3 + paramFloat4 * (1.0F + f * (f * (f * (f * f))));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseStrongOut
 * JD-Core Version:    0.7.0.1
 */