package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.particle.Particle;

public class OffCameraExpireModifier
  implements IParticleModifier
{
  private final Camera mCamera;
  
  public OffCameraExpireModifier(Camera paramCamera)
  {
    this.mCamera = paramCamera;
  }
  
  public Camera getCamera()
  {
    return this.mCamera;
  }
  
  public void onInitializeParticle(Particle paramParticle) {}
  
  public void onUpdateParticle(Particle paramParticle)
  {
    if (!this.mCamera.isRectangularShapeVisible(paramParticle)) {
      paramParticle.setDead(true);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.OffCameraExpireModifier
 * JD-Core Version:    0.7.0.1
 */