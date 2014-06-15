package org.anddev.andengine.util.modifier.ease;

public class EaseBounceIn
  implements IEaseFunction
{
  private static EaseBounceIn INSTANCE;
  
  public static EaseBounceIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseBounceIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 + (paramFloat4 - EaseBounceOut.getInstance().getPercentageDone(paramFloat2 - paramFloat1, paramFloat2, 0.0F, paramFloat4));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseBounceIn
 * JD-Core Version:    0.7.0.1
 */