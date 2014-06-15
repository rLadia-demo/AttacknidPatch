package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;

public abstract class BaseDoubleValueSpanModifier extends BaseSingleValueSpanModifier
{
    private final float mFromValueB;
    private final float mSpanValueB;
    private final float mToValueB;
    
    public BaseDoubleValueSpanModifier(final float n, final float n2, final float mFromValueB, final float mToValueB, final float n3, final float n4) {
        super(n, n2, n3, n4);
        this.mFromValueB = mFromValueB;
        this.mToValueB = mToValueB;
        this.mSpanValueB = this.mToValueB - this.mFromValueB;
    }
    
    protected final float calculateValueB(final float n) {
        return this.mFromValueB + n * this.mSpanValueB;
    }
    
    public void onSetInitialValue(final Particle particle, final float n) {
        this.onSetInitialValues(particle, n, this.mFromValueB);
    }
    
    protected abstract void onSetInitialValues(final Particle p0, final float p1, final float p2);
    
    @Deprecated
    @Override
    protected void onSetValue(final Particle particle, final float n) {
    }
    
    @Override
    protected void onSetValueInternal(final Particle particle, final float n) {
        this.onSetValues(particle, super.calculateValue(n), this.calculateValueB(n));
    }
    
    protected abstract void onSetValues(final Particle p0, final float p1, final float p2);
}
