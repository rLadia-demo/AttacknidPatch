package org.anddev.andengine.util.modifier.ease;

public class EaseBounceInOut
  implements IEaseFunction
{
  private static EaseBounceInOut INSTANCE;
  
  public static EaseBounceInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBounceInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (paramFloat1 < 0.5D * paramFloat2) {
      return paramFloat3 + 0.5F * EaseBounceIn.getInstance().getPercentageDone(paramFloat1 * 2.0F, paramFloat2, 0.0F, paramFloat4);
    }
    return paramFloat3 + (0.5F * EaseBounceOut.getInstance().getPercentageDone(paramFloat1 * 2.0F - paramFloat2, paramFloat2, 0.0F, paramFloat4) + paramFloat4 * 0.5F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBounceInOut
 * JD-Core Version:    0.7.0.1
 */