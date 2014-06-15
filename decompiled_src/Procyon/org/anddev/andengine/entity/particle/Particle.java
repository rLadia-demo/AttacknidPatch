package org.anddev.andengine.entity.particle;

import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;

public class Particle extends Sprite
{
    boolean mDead;
    private float mDeathTime;
    private float mLifeTime;
    
    public Particle(final float n, final float n2, final TextureRegion textureRegion) {
        super(n, n2, textureRegion);
        this.mDeathTime = -1.0f;
        this.mDead = false;
        this.mLifeTime = 0.0f;
    }
    
    public Particle(final float n, final float n2, final TextureRegion textureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, textureRegion, rectangleVertexBuffer);
        this.mDeathTime = -1.0f;
        this.mDead = false;
        this.mLifeTime = 0.0f;
    }
    
    public float getDeathTime() {
        return this.mDeathTime;
    }
    
    public float getLifeTime() {
        return this.mLifeTime;
    }
    
    public boolean isDead() {
        return this.mDead;
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        if (!this.mDead) {
            this.mLifeTime += n;
            super.onManagedUpdate(n);
            final float mDeathTime = this.mDeathTime;
            if (mDeathTime != -1.0f && this.mLifeTime > mDeathTime) {
                this.setDead(true);
            }
        }
    }
    
    @Override
    public void reset() {
        super.reset();
        this.mDead = false;
        this.mDeathTime = -1.0f;
        this.mLifeTime = 0.0f;
    }
    
    public void setDead(final boolean mDead) {
        this.mDead = mDead;
    }
    
    public void setDeathTime(final float mDeathTime) {
        this.mDeathTime = mDeathTime;
    }
}
