package org.anddev.andengine.collision;

import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.util.MathUtils;

public class ShapeCollisionChecker
  extends BaseCollisionChecker
{
  private static final float[] VERTICES_LOCAL_TO_SCENE_TMP = new float[2];
  private static final float[] VERTICES_SCENE_TO_LOCAL_TMP = new float[2];
  
  public static boolean checkCollision(int paramInt1, int paramInt2, float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    int i = paramInt1 - 4;
    if (i < 0) {
      if (!checkCollisionSub(paramInt1 - 2, 0, paramArrayOfFloat1, paramArrayOfFloat2, paramInt2)) {
        break label46;
      }
    }
    label46:
    while ((checkContains(paramArrayOfFloat1, paramInt1, paramArrayOfFloat2[0], paramArrayOfFloat2[1])) || (checkContains(paramArrayOfFloat2, paramInt2, paramArrayOfFloat1[0], paramArrayOfFloat1[1])))
    {
      do
      {
        return true;
      } while (checkCollisionSub(i, i + 2, paramArrayOfFloat1, paramArrayOfFloat2, paramInt2));
      i -= 2;
      break;
    }
    return false;
  }
  
  private static boolean checkCollisionSub(int paramInt1, int paramInt2, float[] paramArrayOfFloat1, float[] paramArrayOfFloat2, int paramInt3)
  {
    float f1 = paramArrayOfFloat1[(paramInt1 + 0)];
    float f2 = paramArrayOfFloat1[(paramInt1 + 1)];
    float f3 = paramArrayOfFloat1[(paramInt2 + 0)];
    float f4 = paramArrayOfFloat1[(paramInt2 + 1)];
    for (int i = paramInt3 - 4;; i -= 2)
    {
      if (i < 0)
      {
        if (!LineCollisionChecker.checkLineCollision(f1, f2, f3, f4, paramArrayOfFloat2[(paramInt3 - 2)], paramArrayOfFloat2[(paramInt3 - 1)], paramArrayOfFloat2[0], paramArrayOfFloat2[1])) {
          break;
        }
        return true;
      }
      if (LineCollisionChecker.checkLineCollision(f1, f2, f3, f4, paramArrayOfFloat2[(i + 0)], paramArrayOfFloat2[(i + 1)], paramArrayOfFloat2[(0 + (i + 2))], paramArrayOfFloat2[(1 + (i + 2))])) {
        return true;
      }
    }
    return false;
  }
  
  public static boolean checkContains(float[] paramArrayOfFloat, int paramInt, float paramFloat1, float paramFloat2)
  {
    int i = 0;
    int m;
    for (int j = paramInt - 4;; j -= 2)
    {
      if (j < 0)
      {
        m = relativeCCW(paramArrayOfFloat[(paramInt - 2)], paramArrayOfFloat[(paramInt - 1)], paramArrayOfFloat[0], paramArrayOfFloat[1], paramFloat1, paramFloat2);
        if (m != 0) {
          break;
        }
        return true;
      }
      int k = relativeCCW(paramArrayOfFloat[j], paramArrayOfFloat[(j + 1)], paramArrayOfFloat[(j + 2)], paramArrayOfFloat[(j + 3)], paramFloat1, paramFloat2);
      if (k == 0) {
        return true;
      }
      i += k;
    }
    int n = i + m;
    int i1 = paramInt / 2;
    return (n == i1) || (n == -i1);
  }
  
  public static float[] convertLocalToSceneCoordinates(Shape paramShape, float paramFloat1, float paramFloat2)
  {
    VERTICES_LOCAL_TO_SCENE_TMP[0] = paramFloat1;
    VERTICES_LOCAL_TO_SCENE_TMP[1] = paramFloat2;
    MathUtils.rotateAndScaleAroundCenter(VERTICES_LOCAL_TO_SCENE_TMP, paramShape.getRotation(), paramShape.getRotationCenterX(), paramShape.getRotationCenterY(), paramShape.getScaleX(), paramShape.getScaleY(), paramShape.getScaleCenterX(), paramShape.getScaleCenterY());
    return VERTICES_LOCAL_TO_SCENE_TMP;
  }
  
  public static float[] convertSceneToLocalCoordinates(Shape paramShape, float paramFloat1, float paramFloat2)
  {
    VERTICES_SCENE_TO_LOCAL_TMP[0] = paramFloat1;
    VERTICES_SCENE_TO_LOCAL_TMP[1] = paramFloat2;
    float f1 = paramShape.getX();
    float f2 = paramShape.getY();
    MathUtils.revertRotateAndScaleAroundCenter(VERTICES_SCENE_TO_LOCAL_TMP, paramShape.getRotation(), f1 + paramShape.getRotationCenterX(), f2 + paramShape.getRotationCenterY(), paramShape.getScaleX(), paramShape.getScaleY(), f1 + paramShape.getScaleCenterX(), f2 + paramShape.getScaleCenterY());
    return VERTICES_SCENE_TO_LOCAL_TMP;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.collision.ShapeCollisionChecker
 * JD-Core Version:    0.7.0.1
 */