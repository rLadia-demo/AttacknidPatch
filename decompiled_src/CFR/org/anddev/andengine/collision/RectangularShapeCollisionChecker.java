/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.collision;

import org.anddev.andengine.collision.BaseCollisionChecker;
import org.anddev.andengine.collision.ShapeCollisionChecker;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.util.MathUtils;

public class RectangularShapeCollisionChecker
extends ShapeCollisionChecker {
    private static final int RECTANGULARSHAPE_VERTEX_COUNT = 4;
    private static final float[] VERTICES_COLLISION_TMP_A;
    private static final float[] VERTICES_COLLISION_TMP_B;
    private static final float[] VERTICES_CONTAINS_TMP;

    @Override
    static {
        RectangularShapeCollisionChecker.VERTICES_CONTAINS_TMP = new float[8];
        RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_A = new float[8];
        RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_B = new float[8];
    }

    public static boolean checkCollision(RectangularShape rectangularShape, RectangularShape rectangularShape2) {
        if (!(rectangularShape.getRotation() != 0.0f || rectangularShape2.getRotation() != 0.0f || rectangularShape.isScaled() || rectangularShape2.isScaled())) {
            float f = rectangularShape.getX();
            float f2 = rectangularShape.getY();
            float f3 = rectangularShape2.getX();
            float f4 = rectangularShape2.getY();
            return BaseCollisionChecker.checkAxisAlignedRectangleCollision(f, f2, f + rectangularShape.getWidth(), f2 + rectangularShape.getHeight(), f3, f4, f3 + rectangularShape2.getWidth(), f4 + rectangularShape2.getHeight());
        }
        RectangularShapeCollisionChecker.fillVertices(rectangularShape, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_A);
        RectangularShapeCollisionChecker.fillVertices(rectangularShape2, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_B);
        return ShapeCollisionChecker.checkCollision(8, 8, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_A, RectangularShapeCollisionChecker.VERTICES_COLLISION_TMP_B);
    }

    public static boolean checkContains(RectangularShape rectangularShape, float f, float f2) {
        RectangularShapeCollisionChecker.fillVertices(rectangularShape, RectangularShapeCollisionChecker.VERTICES_CONTAINS_TMP);
        return ShapeCollisionChecker.checkContains(RectangularShapeCollisionChecker.VERTICES_CONTAINS_TMP, 8, f, f2);
    }

    public static void fillVertices(RectangularShape rectangularShape, float[] arrf) {
        float f = rectangularShape.getX();
        float f2 = rectangularShape.getY();
        float f3 = f + rectangularShape.getWidth();
        float f4 = f2 + rectangularShape.getHeight();
        arrf[0] = f;
        arrf[1] = f2;
        arrf[2] = f3;
        arrf[3] = f2;
        arrf[4] = f3;
        arrf[5] = f4;
        arrf[6] = f;
        arrf[7] = f4;
        MathUtils.rotateAndScaleAroundCenter(arrf, rectangularShape.getRotation(), f + rectangularShape.getRotationCenterX(), f2 + rectangularShape.getRotationCenterY(), rectangularShape.getScaleX(), rectangularShape.getScaleY(), f + rectangularShape.getScaleCenterX(), f2 + rectangularShape.getScaleCenterY());
    }
}

