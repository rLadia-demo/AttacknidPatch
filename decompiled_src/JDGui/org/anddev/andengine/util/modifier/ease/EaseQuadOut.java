package org.anddev.andengine.util.modifier.ease;

public class EaseQuadOut
  implements IEaseFunction
{
  private static EaseQuadOut INSTANCE;
  
  public static EaseQuadOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseQuadOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = -paramFloat4;
    float f2 = paramFloat1 / paramFloat2;
    return paramFloat3 + f1 * f2 * (f2 - 2.0F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseQuadOut
 * JD-Core Version:    0.7.0.1
 */