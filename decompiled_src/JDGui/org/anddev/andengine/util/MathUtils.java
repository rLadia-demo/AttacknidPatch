package org.anddev.andengine.util;

import android.util.FloatMath;
import java.util.Random;
import org.anddev.andengine.util.constants.MathConstants;

public class MathUtils
  implements MathConstants
{
  public static Random RANDOM = new Random(System.nanoTime());
  
  public static final float arrayAverage(float[] paramArrayOfFloat)
  {
    return arraySum(paramArrayOfFloat) / paramArrayOfFloat.length;
  }
  
  public static final float arraySum(float[] paramArrayOfFloat)
  {
    float f = 0.0F;
    int i = paramArrayOfFloat.length;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return f;
      }
      f += paramArrayOfFloat[j];
    }
  }
  
  public static final void arraySumInternal(int[] paramArrayOfInt)
  {
    int i = paramArrayOfInt.length;
    for (int j = 1;; j++)
    {
      if (j >= i) {
        return;
      }
      paramArrayOfInt[j] = (paramArrayOfInt[(j - 1)] + paramArrayOfInt[j]);
    }
  }
  
  public static final void arraySumInternal(long[] paramArrayOfLong)
  {
    int i = paramArrayOfLong.length;
    for (int j = 1;; j++)
    {
      if (j >= i) {
        return;
      }
      paramArrayOfLong[j] = (paramArrayOfLong[(j - 1)] + paramArrayOfLong[j]);
    }
  }
  
  public static final void arraySumInternal(long[] paramArrayOfLong, long paramLong)
  {
    paramArrayOfLong[0] = (paramLong * paramArrayOfLong[0]);
    int i = paramArrayOfLong.length;
    for (int j = 1;; j++)
    {
      if (j >= i) {
        return;
      }
      paramArrayOfLong[j] = (paramArrayOfLong[(j - 1)] + paramLong * paramArrayOfLong[j]);
    }
  }
  
  public static final void arraySumInto(long[] paramArrayOfLong1, long[] paramArrayOfLong2, long paramLong)
  {
    paramArrayOfLong2[0] = (paramLong * paramArrayOfLong1[0]);
    int i = paramArrayOfLong1.length;
    for (int j = 1;; j++)
    {
      if (j >= i) {
        return;
      }
      paramArrayOfLong2[j] = (paramArrayOfLong2[(j - 1)] + paramLong * paramArrayOfLong1[j]);
    }
  }
  
  public static float bringToBounds(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return Math.max(paramFloat1, Math.min(paramFloat2, paramFloat3));
  }
  
  public static int bringToBounds(int paramInt1, int paramInt2, int paramInt3)
  {
    return Math.max(paramInt1, Math.min(paramInt2, paramInt3));
  }
  
  public static final float degToRad(float paramFloat)
  {
    return 0.01745329F * paramFloat;
  }
  
  public static final boolean isPowerOfTwo(int paramInt)
  {
    return (paramInt != 0) && ((paramInt & paramInt - 1) == 0);
  }
  
  public static final int nextPowerOfTwo(int paramInt)
  {
    if (paramInt == 0) {
      return 1;
    }
    int i = paramInt - 1;
    int j = 1;
    for (;;)
    {
      if (j >= 32) {
        return i + 1;
      }
      i |= i >> j;
      j <<= 1;
    }
  }
  
  public static final float radToDeg(float paramFloat)
  {
    return 57.295776F * paramFloat;
  }
  
  public static final float random(float paramFloat1, float paramFloat2)
  {
    return paramFloat1 + RANDOM.nextFloat() * (paramFloat2 - paramFloat1);
  }
  
  public static final int random(int paramInt1, int paramInt2)
  {
    return paramInt1 + RANDOM.nextInt(1 + (paramInt2 - paramInt1));
  }
  
  public static final int randomSign()
  {
    if (RANDOM.nextBoolean()) {
      return 1;
    }
    return -1;
  }
  
  public static float[] revertRotateAndScaleAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    revertScaleAroundCenter(paramArrayOfFloat, paramFloat4, paramFloat5, paramFloat6, paramFloat7);
    return revertRotateAroundCenter(paramArrayOfFloat, paramFloat1, paramFloat2, paramFloat3);
  }
  
  public static float[] revertRotateAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return rotateAroundCenter(paramArrayOfFloat, -paramFloat1, paramFloat2, paramFloat3);
  }
  
  public static float[] revertScaleAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return scaleAroundCenter(paramArrayOfFloat, 1.0F / paramFloat1, 1.0F / paramFloat2, paramFloat3, paramFloat4);
  }
  
  public static float[] rotateAndScaleAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    rotateAroundCenter(paramArrayOfFloat, paramFloat1, paramFloat2, paramFloat3);
    return scaleAroundCenter(paramArrayOfFloat, paramFloat4, paramFloat5, paramFloat6, paramFloat7);
  }
  
  public static float[] rotateAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    float f2;
    float f3;
    if (paramFloat1 != 0.0F)
    {
      float f1 = degToRad(paramFloat1);
      f2 = FloatMath.sin(f1);
      f3 = FloatMath.cos(f1);
    }
    for (int i = -2 + paramArrayOfFloat.length;; i -= 2)
    {
      if (i < 0) {
        return paramArrayOfFloat;
      }
      float f4 = paramArrayOfFloat[i];
      float f5 = paramArrayOfFloat[(i + 1)];
      paramArrayOfFloat[i] = (paramFloat2 + (f3 * (f4 - paramFloat2) - f2 * (f5 - paramFloat3)));
      paramArrayOfFloat[(i + 1)] = (paramFloat3 + (f2 * (f4 - paramFloat2) + f3 * (f5 - paramFloat3)));
    }
  }
  
  public static float[] scaleAroundCenter(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if ((paramFloat1 != 1.0F) || (paramFloat2 != 1.0F)) {}
    for (int i = -2 + paramArrayOfFloat.length;; i -= 2)
    {
      if (i < 0) {
        return paramArrayOfFloat;
      }
      paramArrayOfFloat[i] = (paramFloat3 + paramFloat1 * (paramArrayOfFloat[i] - paramFloat3));
      paramArrayOfFloat[(i + 1)] = (paramFloat4 + paramFloat2 * (paramArrayOfFloat[(i + 1)] - paramFloat4));
    }
  }
  
  public static final int sum(int[] paramArrayOfInt)
  {
    int i = 0;
    for (int j = -1 + paramArrayOfInt.length;; j--)
    {
      if (j < 0) {
        return i;
      }
      i += paramArrayOfInt[j];
    }
  }
  
  public float distance(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    float f1 = paramFloat3 - paramFloat1;
    float f2 = paramFloat4 - paramFloat2;
    return FloatMath.sqrt(f1 * f1 + f2 * f2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.MathUtils
 * JD-Core Version:    0.7.0.1
 */