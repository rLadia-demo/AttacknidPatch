/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.collision;

import org.anddev.andengine.collision.BaseCollisionChecker;
import org.anddev.andengine.collision.LineCollisionChecker;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.util.MathUtils;

public class ShapeCollisionChecker
extends BaseCollisionChecker {
    private static final float[] VERTICES_LOCAL_TO_SCENE_TMP;
    private static final float[] VERTICES_SCENE_TO_LOCAL_TMP;

    static {
        ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP = new float[2];
        ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP = new float[2];
    }

    /*
     * Enabled aggressive block sorting
     */
    public static boolean checkCollision(int n, int n2, float[] arrf, float[] arrf2) {
        int n3 = n - 4;
        do {
            if (n3 < 0) {
                if (!ShapeCollisionChecker.checkCollisionSub(n - 2, 0, arrf, arrf2, n2)) break;
                return true;
            }
            if (ShapeCollisionChecker.checkCollisionSub(n3, n3 + 2, arrf, arrf2, n2)) return true;
            n3-=2;
        } while (true);
        if (ShapeCollisionChecker.checkContains(arrf, n, arrf2[0], arrf2[1])) return true;
        if (ShapeCollisionChecker.checkContains(arrf2, n2, arrf[0], arrf[1])) return true;
        return false;
    }

    private static boolean checkCollisionSub(int n, int n2, float[] arrf, float[] arrf2, int n3) {
        float f = arrf[n + 0];
        float f2 = arrf[n + 1];
        float f3 = arrf[n2 + 0];
        float f4 = arrf[n2 + 1];
        int n4 = n3 - 4;
        do {
            if (n4 < 0) {
                if (!LineCollisionChecker.checkLineCollision(f, f2, f3, f4, arrf2[n3 - 2], arrf2[n3 - 1], arrf2[0], arrf2[1])) return false;
                return true;
            }
            if (LineCollisionChecker.checkLineCollision(f, f2, f3, f4, arrf2[n4 + 0], arrf2[n4 + 1], arrf2[0 + n4 + 2], arrf2[1 + n4 + 2])) {
                return true;
            }
            n4-=2;
        } while (true);
    }

    public static boolean checkContains(float[] arrf, int n, float f, float f2) {
        int n2;
        int n3;
        int n4;
        int n5 = 0;
        int n6 = n - 4;
        do {
            int n7;
            if (n6 < 0) {
                if ((n3 = ShapeCollisionChecker.relativeCCW((float)arrf[n - 2], (float)arrf[n - 1], (float)arrf[0], (float)arrf[1], (float)f, (float)f2)) != 0) break;
                return true;
            }
            if ((n7 = ShapeCollisionChecker.relativeCCW((float)arrf[n6], (float)arrf[n6 + 1], (float)arrf[n6 + 2], (float)arrf[n6 + 3], (float)f, (float)f2)) == 0) {
                return true;
            }
            n5+=n7;
            n6-=2;
        } while (true);
        if ((n4 = n5 + n3) == (n2 = n / 2) || n4 == - n2) return true;
        return false;
    }

    public static float[] convertLocalToSceneCoordinates(Shape shape, float f, float f2) {
        ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP[0] = f;
        ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP[1] = f2;
        MathUtils.rotateAndScaleAroundCenter(ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP, shape.getRotation(), shape.getRotationCenterX(), shape.getRotationCenterY(), shape.getScaleX(), shape.getScaleY(), shape.getScaleCenterX(), shape.getScaleCenterY());
        return ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP;
    }

    public static float[] convertSceneToLocalCoordinates(Shape shape, float f, float f2) {
        ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP[0] = f;
        ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP[1] = f2;
        float f3 = shape.getX();
        float f4 = shape.getY();
        MathUtils.revertRotateAndScaleAroundCenter(ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP, shape.getRotation(), f3 + shape.getRotationCenterX(), f4 + shape.getRotationCenterY(), shape.getScaleX(), shape.getScaleY(), f3 + shape.getScaleCenterX(), f4 + shape.getScaleCenterY());
        return ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP;
    }
}

