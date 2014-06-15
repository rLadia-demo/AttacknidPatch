/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.entity.particle.modifier.IParticleModifier;
import org.anddev.andengine.entity.shape.RectangularShape;

public class OffCameraExpireModifier
implements IParticleModifier {
    private final Camera mCamera;

    public OffCameraExpireModifier(Camera camera) {
        this.mCamera = camera;
    }

    public Camera getCamera() {
        return this.mCamera;
    }

    @Override
    public void onInitializeParticle(Particle particle) {
    }

    @Override
    public void onUpdateParticle(Particle particle) {
        if (this.mCamera.isRectangularShapeVisible(particle)) return;
        particle.setDead(true);
    }
}

