package org.anddev.andengine.entity.shape.util;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.*;
import android.util.*;

public class ShapeUtils
{
    @Deprecated
    public void accelerateRespectingRotation(final IShape shape, final float n, final float n2) {
        final float degToRad = MathUtils.degToRad(shape.getRotation());
        final float sin = FloatMath.sin(degToRad);
        final float cos = FloatMath.cos(degToRad);
        shape.setAcceleration(sin * -n2 + cos * n, cos * n2 + sin * n);
    }
    
    @Deprecated
    public void setVelocityRespectingRotation(final IShape shape, final float n, final float n2) {
        final float degToRad = MathUtils.degToRad(shape.getRotation());
        final float sin = FloatMath.sin(degToRad);
        final float cos = FloatMath.cos(degToRad);
        shape.setVelocity(sin * -n2 + cos * n, cos * n2 + sin * n);
    }
}
