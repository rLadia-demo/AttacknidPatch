package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.util.*;

public class RectangleOutlineParticleEmitter extends BaseRectangleParticleEmitter
{
    public RectangleOutlineParticleEmitter(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
    }
    
    @Override
    public void getPositionOffset(final float[] array) {
        array[0] = this.mCenterX + MathUtils.randomSign() * this.mWidthHalf;
        array[1] = this.mCenterY + MathUtils.randomSign() * this.mHeightHalf;
    }
}
