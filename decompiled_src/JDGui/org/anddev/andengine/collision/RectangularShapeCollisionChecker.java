package org.anddev.andengine.collision;

import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.util.MathUtils;

public class RectangularShapeCollisionChecker
  extends ShapeCollisionChecker
{
  private static final int RECTANGULARSHAPE_VERTEX_COUNT = 4;
  private static final float[] VERTICES_COLLISION_TMP_A = new float[8];
  private static final float[] VERTICES_COLLISION_TMP_B = new float[8];
  private static final float[] VERTICES_CONTAINS_TMP = new float[8];
  
  public static boolean checkCollision(RectangularShape paramRectangularShape1, RectangularShape paramRectangularShape2)
  {
    if ((paramRectangularShape1.getRotation() == 0.0F) && (paramRectangularShape2.getRotation() == 0.0F) && (!paramRectangularShape1.isScaled()) && (!paramRectangularShape2.isScaled()))
    {
      float f1 = paramRectangularShape1.getX();
      float f2 = paramRectangularShape1.getY();
      float f3 = paramRectangularShape2.getX();
      float f4 = paramRectangularShape2.getY();
      return BaseCollisionChecker.checkAxisAlignedRectangleCollision(f1, f2, f1 + paramRectangularShape1.getWidth(), f2 + paramRectangularShape1.getHeight(), f3, f4, f3 + paramRectangularShape2.getWidth(), f4 + paramRectangularShape2.getHeight());
    }
    fillVertices(paramRectangularShape1, VERTICES_COLLISION_TMP_A);
    fillVertices(paramRectangularShape2, VERTICES_COLLISION_TMP_B);
    return ShapeCollisionChecker.checkCollision(8, 8, VERTICES_COLLISION_TMP_A, VERTICES_COLLISION_TMP_B);
  }
  
  public static boolean checkContains(RectangularShape paramRectangularShape, float paramFloat1, float paramFloat2)
  {
    fillVertices(paramRectangularShape, VERTICES_CONTAINS_TMP);
    return ShapeCollisionChecker.checkContains(VERTICES_CONTAINS_TMP, 8, paramFloat1, paramFloat2);
  }
  
  public static void fillVertices(RectangularShape paramRectangularShape, float[] paramArrayOfFloat)
  {
    float f1 = paramRectangularShape.getX();
    float f2 = paramRectangularShape.getY();
    float f3 = f1 + paramRectangularShape.getWidth();
    float f4 = f2 + paramRectangularShape.getHeight();
    paramArrayOfFloat[0] = f1;
    paramArrayOfFloat[1] = f2;
    paramArrayOfFloat[2] = f3;
    paramArrayOfFloat[3] = f2;
    paramArrayOfFloat[4] = f3;
    paramArrayOfFloat[5] = f4;
    paramArrayOfFloat[6] = f1;
    paramArrayOfFloat[7] = f4;
    MathUtils.rotateAndScaleAroundCenter(paramArrayOfFloat, paramRectangularShape.getRotation(), f1 + paramRectangularShape.getRotationCenterX(), f2 + paramRectangularShape.getRotationCenterY(), paramRectangularShape.getScaleX(), paramRectangularShape.getScaleY(), f1 + paramRectangularShape.getScaleCenterX(), f2 + paramRectangularShape.getScaleCenterY());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.collision.RectangularShapeCollisionChecker
 * JD-Core Version:    0.7.0.1
 */