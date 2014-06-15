/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.entity.particle.emitter.BaseParticleEmitter;

public abstract class BaseRectangleParticleEmitter
extends BaseParticleEmitter {
    protected float mHeight;
    protected float mHeightHalf;
    protected float mWidth;
    protected float mWidthHalf;

    public BaseRectangleParticleEmitter(float f, float f2, float f3) {
        this(f, f2, f3, f3);
    }

    public BaseRectangleParticleEmitter(float f, float f2, float f3, float f4) {
        super(f, f2);
        this.setWidth(f3);
        this.setHeight(f4);
    }

    public float getHeight() {
        return this.mHeight;
    }

    public float getWidth() {
        return this.mWidth;
    }

    public void setHeight(float f) {
        this.mHeight = f;
        this.mHeightHalf = 0.5f * f;
    }

    public void setWidth(float f) {
        this.mWidth = f;
        this.mWidthHalf = 0.5f * f;
    }
}

