package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public abstract class BaseTripleValueSpanModifier extends BaseDoubleValueSpanModifier
{
    private final float mFromValueC;
    private final float mSpanValueC;
    private final float mToValueC;
    
    public BaseTripleValueSpanModifier(final float n, final float n2, final float n3, final float n4, final float mFromValueC, final float mToValueC, final float n5, final float n6) {
        super(n, n2, n3, n4, n5, n6);
        this.mFromValueC = mFromValueC;
        this.mToValueC = mToValueC;
        this.mSpanValueC = this.mToValueC - this.mFromValueC;
    }
    
    private final float calculateValueC(final float n) {
        return this.mFromValueC + n * this.mSpanValueC;
    }
    
    public void onSetInitialValues(final Particle particle, final float n, final float n2) {
        this.onSetInitialValues(particle, n, n2, this.mFromValueC);
    }
    
    protected abstract void onSetInitialValues(final Particle p0, final float p1, final float p2, final float p3);
    
    @Override
    protected void onSetValueInternal(final Particle particle, final float n) {
        this.onSetValues(particle, super.calculateValue(n), super.calculateValueB(n), this.calculateValueC(n));
    }
    
    @Deprecated
    @Override
    protected void onSetValues(final Particle particle, final float n, final float n2) {
    }
    
    protected abstract void onSetValues(final Particle p0, final float p1, final float p2, final float p3);
}
