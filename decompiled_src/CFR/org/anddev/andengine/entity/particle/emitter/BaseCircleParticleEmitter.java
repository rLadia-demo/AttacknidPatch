/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.entity.particle.emitter.BaseParticleEmitter;

public abstract class BaseCircleParticleEmitter
extends BaseParticleEmitter {
    protected float mRadiusX;
    protected float mRadiusY;

    public BaseCircleParticleEmitter(float f, float f2, float f3) {
        this(f, f2, f3, f3);
    }

    public BaseCircleParticleEmitter(float f, float f2, float f3, float f4) {
        super(f, f2);
        this.setRadiusX(f3);
        this.setRadiusY(f4);
    }

    public float getRadiusX() {
        return this.mRadiusX;
    }

    public float getRadiusY() {
        return this.mRadiusY;
    }

    public void setRadius(float f) {
        this.mRadiusX = f;
        this.mRadiusY = f;
    }

    public void setRadius(float f, float f2) {
        this.mRadiusX = f;
        this.mRadiusY = f2;
    }

    public void setRadiusX(float f) {
        this.mRadiusX = f;
    }

    public void setRadiusY(float f) {
        this.mRadiusY = f;
    }
}

