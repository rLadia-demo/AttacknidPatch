package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.util.*;

public class RectangleParticleEmitter extends BaseRectangleParticleEmitter
{
    public RectangleParticleEmitter(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    @Override
    public void getPositionOffset(final float[] array) {
        array[0] = this.mCenterX - this.mWidthHalf + MathUtils.RANDOM.nextFloat() * this.mWidth;
        array[1] = this.mCenterY - this.mHeightHalf + MathUtils.RANDOM.nextFloat() * this.mHeight;
    }
}
