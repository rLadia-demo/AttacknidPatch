/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.FloatMath
 */
package org.anddev.andengine.entity.shape.util;

import android.util.FloatMath;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.MathUtils;

public class ShapeUtils {
    @Deprecated
    public void accelerateRespectingRotation(IShape iShape, float f, float f2) {
        float f3 = MathUtils.degToRad(iShape.getRotation());
        float f4 = FloatMath.sin((float)f3);
        float f5 = FloatMath.cos((float)f3);
        iShape.setAcceleration(f4 * (- f2) + f5 * f, f5 * f2 + f4 * f);
    }

    @Deprecated
    public void setVelocityRespectingRotation(IShape iShape, float f, float f2) {
        float f3 = MathUtils.degToRad(iShape.getRotation());
        float f4 = FloatMath.sin((float)f3);
        float f5 = FloatMath.cos((float)f3);
        iShape.setVelocity(f4 * (- f2) + f5 * f, f5 * f2 + f4 * f);
    }
}

