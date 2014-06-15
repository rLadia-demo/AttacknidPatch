package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.util.*;
import android.util.*;

public class CircleParticleEmitter extends BaseCircleParticleEmitter
{
    public CircleParticleEmitter(final float n, final float n2, final float n3) {
        super(n, n2, n3);
    }
    
    public CircleParticleEmitter(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    @Override
    public void getPositionOffset(final float[] array) {
        final float n = 2.0f * (3.1415927f * MathUtils.RANDOM.nextFloat());
        array[0] = this.mCenterX + FloatMath.cos(n) * this.mRadiusX * MathUtils.RANDOM.nextFloat();
        array[1] = this.mCenterY + FloatMath.sin(n) * this.mRadiusY * MathUtils.RANDOM.nextFloat();
    }
}
