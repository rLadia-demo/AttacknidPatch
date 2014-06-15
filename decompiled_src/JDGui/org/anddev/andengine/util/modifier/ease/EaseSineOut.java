package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.constants.MathConstants;

public class EaseSineOut
  implements IEaseFunction, MathConstants
{
  private static EaseSineOut INSTANCE;
  
  public static EaseSineOut getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseSineOut();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 + paramFloat4 * FloatMath.sin(1.570796F * (paramFloat1 / paramFloat2));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseSineOut
 * JD-Core Version:    0.7.0.1
 */