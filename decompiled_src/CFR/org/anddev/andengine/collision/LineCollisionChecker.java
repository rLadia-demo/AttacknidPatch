/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.collision;

import org.anddev.andengine.collision.ShapeCollisionChecker;

public class LineCollisionChecker
extends ShapeCollisionChecker {
    public static boolean checkLineCollision(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        if (LineCollisionChecker.relativeCCW((float)f, (float)f2, (float)f3, (float)f4, (float)f5, (float)f6) * LineCollisionChecker.relativeCCW((float)f, (float)f2, (float)f3, (float)f4, (float)f7, (float)f8) > 0 || LineCollisionChecker.relativeCCW((float)f5, (float)f6, (float)f7, (float)f8, (float)f, (float)f2) * LineCollisionChecker.relativeCCW((float)f5, (float)f6, (float)f7, (float)f8, (float)f3, (float)f4) > 0) return false;
        return true;
    }
}

