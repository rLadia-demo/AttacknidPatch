package org.anddev.andengine.collision;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.*;

public class RectangularShapeCollisionChecker extends ShapeCollisionChecker
{
    private static final int RECTANGULARSHAPE_VERTEX_COUNT = 4;
    private static final float[] VERTICES_COLLISION_TMP_A;
    private static final float[] VERTICES_COLLISION_TMP_B;
    private static final float[] VERTICES_CONTAINS_TMP;
    
    static {
        VERTICES_CONTAINS_TMP = new float[8];
        VERTICES_COLLISION_TMP_A = new float[8];
        VERTICES_COLLISION_TMP_B = new float[8];
    }
    
    public static boolean checkCollision(final RectangularShape rectangularShape, final RectangularShape rectangularShape2) {
        if (rectangularShape.getRotation() == 0.0f && rectangularShape2.getRotation() == 0.0f && !rectangularShape.isScaled() && !rectangularShape2.isScaled()) {
            final float x = rectangularShape.getX();
            final float y = rectangularShape.getY();
            final float x2 = rectangularShape2.getX();
            final float y2 = rectangularShape2.getY();
            return BaseCollisionChecker.checkAxisAlignedRectangleCollision(x, y, x + rectangularShape.getWidth(), y + rectangularShape.getHeight(), x2, y2, x2 + rectangularShape2.getWidth(), y2 + rectangularShape2.getHeight());
        }
        fillVertices(rectangularShape, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_A);
        fillVertices(rectangularShape2, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_B);
        return ShapeCollisionChecker.checkCollision(8, 8, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_A, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_B);
    }
    
    public static boolean checkContains(final RectangularShape rectangularShape, final float n, final float n2) {
        fillVertices(rectangularShape, RectangularShapeCollisionChecker.VERTICES_CONTAINS_TMP);
        return ShapeCollisionChecker.checkContains(RectangularShapeCollisionChecker.VERTICES_CONTAINS_TMP, 8, n, n2);
    }
    
    public static void fillVertices(final RectangularShape rectangularShape, final float[] array) {
        final float x = rectangularShape.getX();
        final float y = rectangularShape.getY();
        final float n = x + rectangularShape.getWidth();
        final float n2 = y + rectangularShape.getHeight();
        array[0] = x;
        array[1] = y;
        array[2] = n;
        array[3] = y;
        array[4] = n;
        array[5] = n2;
        array[6] = x;
        array[7] = n2;
        MathUtils.rotateAndScaleAroundCenter(array, rectangularShape.getRotation(), x + rectangularShape.getRotationCenterX(), y + rectangularShape.getRotationCenterY(), rectangularShape.getScaleX(), rectangularShape.getScaleY(), x + rectangularShape.getScaleCenterX(), y + rectangularShape.getScaleCenterY());
    }
}
