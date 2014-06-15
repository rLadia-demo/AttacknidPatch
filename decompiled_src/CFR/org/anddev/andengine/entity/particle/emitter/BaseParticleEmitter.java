/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.entity.particle.emitter.IParticleEmitter;

public abstract class BaseParticleEmitter
implements IParticleEmitter {
    protected float mCenterX;
    protected float mCenterY;

    public BaseParticleEmitter(float f, float f2) {
        this.mCenterX = f;
        this.mCenterY = f2;
    }

    public float getCenterX() {
        return this.mCenterX;
    }

    public float getCenterY() {
        return this.mCenterY;
    }

    @Override
    public void onUpdate(float f) {
    }

    @Override
    public void reset() {
    }

    public void setCenter(float f, float f2) {
        this.mCenterX = f;
        this.mCenterY = f2;
    }

    public void setCenterX(float f) {
        this.mCenterX = f;
    }

    public void setCenterY(float f) {
        this.mCenterY = f;
    }
}

