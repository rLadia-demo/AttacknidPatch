package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseRectangleParticleEmitter extends BaseParticleEmitter
{
    protected float mHeight;
    protected float mHeightHalf;
    protected float mWidth;
    protected float mWidthHalf;
    
    public BaseRectangleParticleEmitter(final float n, final float n2, final float n3) {
        this(n, n2, n3, n3);
    }
    
    public BaseRectangleParticleEmitter(final float n, final float n2, final float width, final float height) {
        super(n, n2);
        this.setWidth(width);
        this.setHeight(height);
    }
    
    public float getHeight() {
        return this.mHeight;
    }
    
    public float getWidth() {
        return this.mWidth;
    }
    
    public void setHeight(final float mHeight) {
        this.mHeight = mHeight;
        this.mHeightHalf = 0.5f * mHeight;
    }
    
    public void setWidth(final float mWidth) {
        this.mWidth = mWidth;
        this.mWidthHalf = 0.5f * mWidth;
    }
}
