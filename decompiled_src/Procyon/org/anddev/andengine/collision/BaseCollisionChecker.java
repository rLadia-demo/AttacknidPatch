package org.anddev.andengine.collision;

public class BaseCollisionChecker
{
    public static boolean checkAxisAlignedRectangleCollision(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final float n8) {
        return n < n7 && n5 < n3 && n2 < n8 && n6 < n4;
    }
    
    public static int relativeCCW(final float n, final float n2, final float n3, final float n4, final float n5, final float n6) {
        final float n7 = n3 - n;
        final float n8 = n4 - n2;
        final float n9 = n5 - n;
        final float n10 = n6 - n2;
        float n11 = n9 * n8 - n10 * n7;
        if (n11 == 0.0f) {
            n11 = n9 * n7 + n10 * n8;
            if (n11 > 0.0f) {
                n11 = (n9 - n7) * n7 + (n10 - n8) * n8;
                if (n11 < 0.0f) {
                    n11 = 0.0f;
                }
            }
        }
        if (n11 < 0.0f) {
            return -1;
        }
        if (n11 > 0.0f) {
            return 1;
        }
        return 0;
    }
}
