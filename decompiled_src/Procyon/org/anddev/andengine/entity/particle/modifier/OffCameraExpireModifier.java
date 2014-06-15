package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.particle.*;
import org.anddev.andengine.entity.shape.*;

public class OffCameraExpireModifier implements IParticleModifier
{
    private final Camera mCamera;
    
    public OffCameraExpireModifier(final Camera mCamera) {
        super();
        this.mCamera = mCamera;
    }
    
    public Camera getCamera() {
        return this.mCamera;
    }
    
    @Override
    public void onInitializeParticle(final Particle particle) {
    }
    
    @Override
    public void onUpdateParticle(final Particle particle) {
        if (!this.mCamera.isRectangularShapeVisible(particle)) {
            particle.setDead(true);
        }
    }
}
