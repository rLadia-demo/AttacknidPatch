package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.constants.MathConstants;

public class EaseElasticInOut
  implements IEaseFunction, MathConstants
{
  private static EaseElasticInOut INSTANCE;
  
  public static EaseElasticInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseElasticInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (paramFloat1 == 0.0F) {
      return paramFloat3;
    }
    float f1 = (float)(paramFloat1 / (0.5D * paramFloat2));
    if (f1 == 2.0F) {
      return paramFloat3 + paramFloat4;
    }
    boolean bool = 0.0F < 0.0F;
    float f2 = 0.0F;
    if (!bool) {
      f2 = paramFloat2 * 0.45F;
    }
    float f3;
    float f4;
    if ((0.0F == 0.0F) || ((paramFloat4 > 0.0F) && (0.0F < paramFloat4)) || ((paramFloat4 < 0.0F) && (0.0F < -paramFloat4)))
    {
      f3 = paramFloat4;
      f4 = f2 / 4.0F;
    }
    while (f1 < 1.0F)
    {
      double d2 = f3;
      float f6 = f1 - 1.0F;
      return (float)(-0.5D * (d2 * Math.pow(2.0D, 10.0F * f6) * FloatMath.sin(6.283186F * (f6 * paramFloat2 - f4) / f2)) + paramFloat3);
      f4 = (float)(f2 / 6.283186F * Math.asin(paramFloat4 / 0.0F));
      f3 = 0.0F;
    }
    double d1 = f3;
    float f5 = f1 - 1.0F;
    return (float)(0.5D * (d1 * Math.pow(2.0D, -10.0F * f5) * FloatMath.sin(6.283186F * (f5 * paramFloat2 - f4) / f2)) + paramFloat4 + paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseElasticInOut
 * JD-Core Version:    0.7.0.1
 */