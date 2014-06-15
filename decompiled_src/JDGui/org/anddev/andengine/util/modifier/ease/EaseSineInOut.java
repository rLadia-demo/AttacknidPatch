package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;

public class EaseSineInOut
  implements IEaseFunction
{
  private static EaseSineInOut INSTANCE;
  
  public static EaseSineInOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseSineInOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 + 0.5F * -paramFloat4 * (FloatMath.cos(3.141593F * paramFloat1 / paramFloat2) - 1.0F);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseSineInOut
 * JD-Core Version:    0.7.0.1
 */