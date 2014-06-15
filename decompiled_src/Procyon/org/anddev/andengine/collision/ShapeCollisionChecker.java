package org.anddev.andengine.collision;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.*;

public class ShapeCollisionChecker extends BaseCollisionChecker
{
    private static final float[] VERTICES_LOCAL_TO_SCENE_TMP;
    private static final float[] VERTICES_SCENE_TO_LOCAL_TMP;
    
    static {
        VERTICES_SCENE_TO_LOCAL_TMP = new float[2];
        VERTICES_LOCAL_TO_SCENE_TMP = new float[2];
    }
    
    public static boolean checkCollision(final int n, final int n2, final float[] array, final float[] array2) {
        for (int i = n - 4; i >= 0; i -= 2) {
            if (checkCollisionSub(i, i + 2, array, array2, n2)) {
                return true;
            }
        }
        if (!checkCollisionSub(n - 2, 0, array, array2, n2) && !checkContains(array, n, array2[0], array2[1]) && !checkContains(array2, n2, array[0], array[1])) {
            return false;
        }
        return true;
    }
    
    private static boolean checkCollisionSub(final int n, final int n2, final float[] array, final float[] array2, final int n3) {
        final float n4 = array[n + 0];
        final float n5 = array[n + 1];
        final float n6 = array[n2 + 0];
        final float n7 = array[n2 + 1];
        for (int i = n3 - 4; i >= 0; i -= 2) {
            if (LineCollisionChecker.checkLineCollision(n4, n5, n6, n7, array2[i + 0], array2[i + 1], array2[0 + (i + 2)], array2[1 + (i + 2)])) {
                return true;
            }
        }
        return LineCollisionChecker.checkLineCollision(n4, n5, n6, n7, array2[n3 - 2], array2[n3 - 1], array2[0], array2[1]);
    }
    
    public static boolean checkContains(final float[] array, final int n, final float n2, final float n3) {
        int n4 = 0;
        for (int i = n - 4; i >= 0; i -= 2) {
            final int relativeCCW = BaseCollisionChecker.relativeCCW(array[i], array[i + 1], array[i + 2], array[i + 3], n2, n3);
            if (relativeCCW == 0) {
                return true;
            }
            n4 += relativeCCW;
        }
        final int relativeCCW2 = BaseCollisionChecker.relativeCCW(array[n - 2], array[n - 1], array[0], array[1], n2, n3);
        if (relativeCCW2 == 0) {
            return true;
        }
        final int n5 = n4 + relativeCCW2;
        final int n6 = n / 2;
        return n5 == n6 || n5 == -n6;
    }
    
    public static float[] convertLocalToSceneCoordinates(final Shape shape, final float n, final float n2) {
        ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP[0] = n;
        ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP[1] = n2;
        MathUtils.rotateAndScaleAroundCenter(ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP, shape.getRotation(), shape.getRotationCenterX(), shape.getRotationCenterY(), shape.getScaleX(), shape.getScaleY(), shape.getScaleCenterX(), shape.getScaleCenterY());
        return ShapeCollisionChecker.VERTICES_LOCAL_TO_SCENE_TMP;
    }
    
    public static float[] convertSceneToLocalCoordinates(final Shape shape, final float n, final float n2) {
        ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP[0] = n;
        ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP[1] = n2;
        final float x = shape.getX();
        final float y = shape.getY();
        MathUtils.revertRotateAndScaleAroundCenter(ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP, shape.getRotation(), x + shape.getRotationCenterX(), y + shape.getRotationCenterY(), shape.getScaleX(), shape.getScaleY(), x + shape.getScaleCenterX(), y + shape.getScaleCenterY());
        return ShapeCollisionChecker.VERTICES_SCENE_TO_LOCAL_TMP;
    }
}
