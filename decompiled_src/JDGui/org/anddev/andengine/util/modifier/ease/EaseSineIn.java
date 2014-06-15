package org.anddev.andengine.util.modifier.ease;

import android.util.FloatMath;
import org.anddev.andengine.util.constants.MathConstants;

public class EaseSineIn
  implements IEaseFunction, MathConstants
{
  private static EaseSineIn INSTANCE;
  
  public static EaseSineIn getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new EaseSineIn();
    }
    return INSTANCE;
  }
  
  public float getPercentageDone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 + (paramFloat4 + -paramFloat4 * FloatMath.cos(1.570796F * (paramFloat1 / paramFloat2)));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.ease.EaseSineIn
 * JD-Core Version:    0.7.0.1
 */