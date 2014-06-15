package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class AlphaModifier
  extends BaseSingleValueSpanModifier
{
  public AlphaModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  protected void onSetInitialValue(Particle paramParticle, float paramFloat)
  {
    paramParticle.setAlpha(paramFloat);
  }
  
  protected void onSetValue(Particle paramParticle, float paramFloat)
  {
    paramParticle.setAlpha(paramFloat);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.AlphaModifier
 * JD-Core Version:    0.7.0.1
 */