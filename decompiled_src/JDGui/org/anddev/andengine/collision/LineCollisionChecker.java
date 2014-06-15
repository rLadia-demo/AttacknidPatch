package org.anddev.andengine.collision;

public class LineCollisionChecker
  extends ShapeCollisionChecker
{
  public static boolean checkLineCollision(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8)
  {
    return (relativeCCW(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6) * relativeCCW(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat7, paramFloat8) <= 0) && (relativeCCW(paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat1, paramFloat2) * relativeCCW(paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat3, paramFloat4) <= 0);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.collision.LineCollisionChecker
 * JD-Core Version:    0.7.0.1
 */