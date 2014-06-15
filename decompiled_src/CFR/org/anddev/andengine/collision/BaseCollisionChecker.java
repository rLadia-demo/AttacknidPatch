/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.collision;

public class BaseCollisionChecker {
    public static boolean checkAxisAlignedRectangleCollision(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        if (f >= f7 || f5 >= f3 || f2 >= f8 || f6 >= f4) return false;
        return true;
    }

    public static int relativeCCW(float f, float f2, float f3, float f4, float f5, float f6) {
        float f7 = f3 - f;
        float f8 = f4 - f2;
        float f9 = f5 - f;
        float f10 = f6 - f2;
        float f11 = f9 * f8 - f10 * f7;
        if (f11 == 0.0f && (f11 = f9 * f7 + f10 * f8) > 0.0f) {
            float f12 = f9 - f7;
            float f13 = f10 - f8;
            if ((f11 = f12 * f7 + f13 * f8) < 0.0f) {
                f11 = 0.0f;
            }
        }
        if (f11 < 0.0f) {
            return -1;
        }
        if (f11 <= 0.0f) return 0;
        return 1;
    }
}

