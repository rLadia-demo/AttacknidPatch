package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.particle.*;

public abstract class BaseTripleValueInitializer extends BaseDoubleValueInitializer
{
    protected float mMaxValueC;
    protected float mMinValueC;
    
    public BaseTripleValueInitializer(final float n, final float n2, final float n3, final float n4, final float mMinValueC, final float mMaxValueC) {
        super(n, n2, n3, n4);
        this.mMinValueC = mMinValueC;
        this.mMaxValueC = mMaxValueC;
    }
    
    private final float getRandomValueC() {
        if (this.mMinValueC == this.mMaxValueC) {
            return this.mMaxValueC;
        }
        return MathUtils.RANDOM.nextFloat() * (this.mMaxValueC - this.mMinValueC) + this.mMinValueC;
    }
    
    @Override
    protected void onInitializeParticle(final Particle particle, final float n, final float n2) {
        this.onInitializeParticle(particle, n, n2, this.getRandomValueC());
    }
    
    protected abstract void onInitializeParticle(final Particle p0, final float p1, final float p2, final float p3);
}
