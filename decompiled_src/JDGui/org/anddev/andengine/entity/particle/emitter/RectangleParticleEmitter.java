package org.anddev.andengine.entity.particle.emitter;

import java.util.Random;
import org.anddev.andengine.util.MathUtils;

public class RectangleParticleEmitter
  extends BaseRectangleParticleEmitter
{
  public RectangleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void getPositionOffset(float[] paramArrayOfFloat)
  {
    paramArrayOfFloat[0] = (this.mCenterX - this.mWidthHalf + MathUtils.RANDOM.nextFloat() * this.mWidth);
    paramArrayOfFloat[1] = (this.mCenterY - this.mHeightHalf + MathUtils.RANDOM.nextFloat() * this.mHeight);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.RectangleParticleEmitter
 * JD-Core Version:    0.7.0.1
 */