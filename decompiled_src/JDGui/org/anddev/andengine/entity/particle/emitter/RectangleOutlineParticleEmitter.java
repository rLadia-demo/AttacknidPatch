package org.anddev.andengine.entity.particle.emitter;

import org.anddev.andengine.util.MathUtils;

public class RectangleOutlineParticleEmitter
  extends BaseRectangleParticleEmitter
{
  public RectangleOutlineParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void getPositionOffset(float[] paramArrayOfFloat)
  {
    paramArrayOfFloat[0] = (this.mCenterX + MathUtils.randomSign() * this.mWidthHalf);
    paramArrayOfFloat[1] = (this.mCenterY + MathUtils.randomSign() * this.mHeightHalf);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.RectangleOutlineParticleEmitter
 * JD-Core Version:    0.7.0.1
 */