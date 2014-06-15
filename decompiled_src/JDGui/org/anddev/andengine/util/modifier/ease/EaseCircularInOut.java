package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;

public class EaseCircularInOut
  implements IEaseFunction
{
  private static EaseCircularInOut INSTANCE;
  
  public static EaseCircularInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseCircularInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = (float)(paramFloat1 / (0.5D * paramFloat2));
    if (f1 < 1.0F) {
      return (float)(0.5D * -paramFloat4 * (FloatMath.sqrt(1.0F - f1 * f1) - 1.0F) + paramFloat3);
    }
    double d = 0.5D * paramFloat4;
    float f2 = f1 - 2.0F;
    return (float)(d * (1.0F + FloatMath.sqrt(1.0F - f2 * f2)) + paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseCircularInOut
 * JD-Core Version:    0.7.0.1
 */