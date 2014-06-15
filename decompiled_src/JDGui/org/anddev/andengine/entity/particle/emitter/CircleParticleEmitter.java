package org.anddev.andengine.entity.particle.emitter;

import android.util.FloatMath;
import java.util.Random;
import org.anddev.andengine.util.MathUtils;

public class CircleParticleEmitter
  extends BaseCircleParticleEmitter
{
  public CircleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    super(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public CircleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void getPositionOffset(float[] paramArrayOfFloat)
  {
    float f = 2.0F * (3.141593F * MathUtils.RANDOM.nextFloat());
    paramArrayOfFloat[0] = (this.mCenterX + FloatMath.cos(f) * this.mRadiusX * MathUtils.RANDOM.nextFloat());
    paramArrayOfFloat[1] = (this.mCenterY + FloatMath.sin(f) * this.mRadiusY * MathUtils.RANDOM.nextFloat());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.CircleParticleEmitter
 * JD-Core Version:    0.7.0.1
 */