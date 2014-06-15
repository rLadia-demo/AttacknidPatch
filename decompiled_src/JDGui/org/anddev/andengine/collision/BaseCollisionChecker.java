package org.anddev.andengine.collision;

public class BaseCollisionChecker
{
  public static boolean checkAxisAlignedRectangleCollision(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8)
  {
    return (paramFloat1 < paramFloat7) && (paramFloat5 < paramFloat3) && (paramFloat2 < paramFloat8) && (paramFloat6 < paramFloat4);
  }
  
  public static int relativeCCW(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    float f1 = paramFloat3 - paramFloat1;
    float f2 = paramFloat4 - paramFloat2;
    float f3 = paramFloat5 - paramFloat1;
    float f4 = paramFloat6 - paramFloat2;
    float f5 = f3 * f2 - f4 * f1;
    if (f5 == 0.0F)
    {
      f5 = f3 * f1 + f4 * f2;
      if (f5 > 0.0F)
      {
        float f6 = f3 - f1;
        float f7 = f4 - f2;
        f5 = f6 * f1 + f7 * f2;
        if (f5 < 0.0F) {
          f5 = 0.0F;
        }
      }
    }
    if (f5 < 0.0F) {
      return -1;
    }
    if (f5 > 0.0F) {
      return 1;
    }
    return 0;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.collision.BaseCollisionChecker
 * JD-Core Version:    0.7.0.1
 */