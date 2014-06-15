package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseParticleEmitter implements IParticleEmitter
{
    protected float mCenterX;
    protected float mCenterY;
    
    public BaseParticleEmitter(final float mCenterX, final float mCenterY) {
        super();
        this.mCenterX = mCenterX;
        this.mCenterY = mCenterY;
    }
    
    public float getCenterX() {
        return this.mCenterX;
    }
    
    public float getCenterY() {
        return this.mCenterY;
    }
    
    @Override
    public void onUpdate(final float n) {
    }
    
    @Override
    public void reset() {
    }
    
    public void setCenter(final float mCenterX, final float mCenterY) {
        this.mCenterX = mCenterX;
        this.mCenterY = mCenterY;
    }
    
    public void setCenterX(final float mCenterX) {
        this.mCenterX = mCenterX;
    }
    
    public void setCenterY(final float mCenterY) {
        this.mCenterY = mCenterY;
    }
}
