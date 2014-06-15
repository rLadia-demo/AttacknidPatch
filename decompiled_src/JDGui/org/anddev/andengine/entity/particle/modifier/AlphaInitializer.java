package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class AlphaInitializer
  extends BaseSingleValueInitializer
{
  public AlphaInitializer(float paramFloat)
  {
    super(paramFloat, paramFloat);
  }
  
  public AlphaInitializer(float paramFloat1, float paramFloat2)
  {
    super(paramFloat1, paramFloat2);
  }
  
  protected void onInitializeParticle(Particle paramParticle, float paramFloat)
  {
    paramParticle.setAlpha(paramFloat);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.AlphaInitializer
 * JD-Core Version:    0.7.0.1
 */