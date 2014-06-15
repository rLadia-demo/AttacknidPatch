package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseCircleParticleEmitter extends BaseParticleEmitter
{
    protected float mRadiusX;
    protected float mRadiusY;
    
    public BaseCircleParticleEmitter(final float n, final float n2, final float n3) {
        this(n, n2, n3, n3);
    }
    
    public BaseCircleParticleEmitter(final float n, final float n2, final float radiusX, final float radiusY) {
        super(n, n2);
        this.setRadiusX(radiusX);
        this.setRadiusY(radiusY);
    }
    
    public float getRadiusX() {
        return this.mRadiusX;
    }
    
    public float getRadiusY() {
        return this.mRadiusY;
    }
    
    public void setRadius(final float n) {
        this.mRadiusX = n;
        this.mRadiusY = n;
    }
    
    public void setRadius(final float mRadiusX, final float mRadiusY) {
        this.mRadiusX = mRadiusX;
        this.mRadiusY = mRadiusY;
    }
    
    public void setRadiusX(final float mRadiusX) {
        this.mRadiusX = mRadiusX;
    }
    
    public void setRadiusY(final float mRadiusY) {
        this.mRadiusY = mRadiusY;
    }
}
