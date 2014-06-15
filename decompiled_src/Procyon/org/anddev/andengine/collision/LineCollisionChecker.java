package org.anddev.andengine.collision;

public class LineCollisionChecker extends ShapeCollisionChecker
{
    public static boolean checkLineCollision(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final float n8) {
        return BaseCollisionChecker.relativeCCW(n, n2, n3, n4, n5, n6) * BaseCollisionChecker.relativeCCW(n, n2, n3, n4, n7, n8) <= 0 && BaseCollisionChecker.relativeCCW(n5, n6, n7, n8, n, n2) * BaseCollisionChecker.relativeCCW(n5, n6, n7, n8, n3, n4) <= 0;
    }
}
