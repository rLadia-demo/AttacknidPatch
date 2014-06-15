package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.*;
import org.anddev.andengine.util.*;

public class ExpireModifier implements IParticleModifier
{
    private float mMaxLifeTime;
    private float mMinLifeTime;
    
    public ExpireModifier(final float n) {
        this(n, n);
    }
    
    public ExpireModifier(final float mMinLifeTime, final float mMaxLifeTime) {
        super();
        this.mMinLifeTime = mMinLifeTime;
        this.mMaxLifeTime = mMaxLifeTime;
    }
    
    public float getMaxLifeTime() {
        return this.mMaxLifeTime;
    }
    
    public float getMinLifeTime() {
        return this.mMinLifeTime;
    }
    
    @Override
    public void onInitializeParticle(final Particle particle) {
        particle.setDeathTime(MathUtils.RANDOM.nextFloat() * (this.mMaxLifeTime - this.mMinLifeTime) + this.mMinLifeTime);
    }
    
    @Override
    public void onUpdateParticle(final Particle particle) {
    }
    
    public void setLifeTime(final float n) {
        this.mMinLifeTime = n;
        this.mMaxLifeTime = n;
    }
    
    public void setLifeTime(final float mMinLifeTime, final float mMaxLifeTime) {
        this.mMinLifeTime = mMinLifeTime;
        this.mMaxLifeTime = mMaxLifeTime;
    }
}
