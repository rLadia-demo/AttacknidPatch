package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;

public class EaseCircularIn
  implements IEaseFunction
{
  private static EaseCircularIn INSTANCE;
  
  public static EaseCircularIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCircularIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = -paramFloat4;
    float f2 = paramFloat1 / paramFloat2;
    return paramFloat3 + f1 * (FloatMath.sqrt(1.0F - f2 * f2) - 1.0F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCircularIn
 * JD-Core Version:    0.7.0.1
 */