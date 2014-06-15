package org.anddev.andengine.util.modifier.util;

import org.anddev.andengine.util.modifier.IModifier;

public class ModifierUtils
{
  public static <T> IModifier<T> getModifierWithLongestDuration(IModifier<T>[] paramArrayOfIModifier)
  {
    IModifier<T> localIModifier = null;
    float f1 = 1.4E-45F;
    for (int i = -1 + paramArrayOfIModifier.length;; i--)
    {
      if (i < 0) {
        return localIModifier;
      }
      float f2 = paramArrayOfIModifier[i].getDuration();
      if (f2 > f1)
      {
        f1 = f2;
        localIModifier = paramArrayOfIModifier[i];
      }
    }
  }
  
  public static float getSequenceDurationOfModifier(IModifier<?>[] paramArrayOfIModifier)
  {
    float f = 1.4E-45F;
    for (int i = -1 + paramArrayOfIModifier.length;; i--)
    {
      if (i < 0) {
        return f;
      }
      f += paramArrayOfIModifier[i].getDuration();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.modifier.util.ModifierUtils
 * JD-Core Version:    0.7.0.1
 */