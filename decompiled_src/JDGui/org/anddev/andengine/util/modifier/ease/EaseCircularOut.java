package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;

public class EaseCircularOut
  implements IEaseFunction
{
  private static EaseCircularOut INSTANCE;
  
  public static EaseCircularOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCircularOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f = paramFloat1 / paramFloat2 - 1.0F;
    return paramFloat3 + paramFloat4 * FloatMath.sqrt(1.0F - f * f);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCircularOut
 * JD-Core Version:    0.7.0.1
 */