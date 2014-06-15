package org.anddev.andengine.util.modifier.ease;

public class EaseLinear
  implements IEaseFunction
{
  private static EaseLinear INSTANCE;
  
  public static EaseLinear getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseLinear();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 + paramFloat4 * paramFloat1 / paramFloat2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseLinear
 * JD-Core Version:    0.7.0.1
 */