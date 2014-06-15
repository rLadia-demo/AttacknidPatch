/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle;

import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class Particle
extends Sprite {
    boolean mDead = false;
    private float mDeathTime = -1.0f;
    private float mLifeTime = 0.0f;

    public Particle(float f, float f2, TextureRegion textureRegion) {
        super(f, f2, textureRegion);
    }

    public Particle(float f, float f2, TextureRegion textureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, textureRegion, rectangleVertexBuffer);
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
    protected void onManagedUpdate(float f) {
        if (this.mDead) return;
        this.mLifeTime = f + this.mLifeTime;
        super.onManagedUpdate(f);
        float f2 = this.mDeathTime;
        if (f2 == -1.0f || this.mLifeTime <= f2) return;
        this.setDead(true);
    }

    @Override
    public void reset() {
        super.reset();
        this.mDead = false;
        this.mDeathTime = -1.0f;
        this.mLifeTime = 0.0f;
    }

    public void setDead(boolean bl) {
        this.mDead = bl;
    }

    public void setDeathTime(float f) {
        this.mDeathTime = f;
    }
}

