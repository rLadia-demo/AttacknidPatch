package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.particle.*;

public abstract class BaseDoubleValueInitializer extends BaseSingleValueInitializer
{
    protected float mMaxValueB;
    protected float mMinValueB;
    
    public BaseDoubleValueInitializer(final float n, final float n2, final float mMinValueB, final float mMaxValueB) {
        super(n, n2);
        this.mMinValueB = mMinValueB;
        this.mMaxValueB = mMaxValueB;
    }
    
    private final float getRandomValueB() {
        if (this.mMinValueB == this.mMaxValueB) {
            return this.mMaxValueB;
        }
        return MathUtils.RANDOM.nextFloat() * (this.mMaxValueB - this.mMinValueB) + this.mMinValueB;
    }
    
    @Override
    protected void onInitializeParticle(final Particle particle, final float n) {
        this.onInitializeParticle(particle, n, this.getRandomValueB());
    }
    
    protected abstract void onInitializeParticle(final Particle p0, final float p1, final float p2);
}
