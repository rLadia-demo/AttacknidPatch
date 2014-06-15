package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class ColorModifier
  extends BaseTripleValueSpanModifier
{
  public ColorModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8);
  }
  
  protected void onSetInitialValues(Particle paramParticle, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramParticle.setColor(paramFloat1, paramFloat2, paramFloat3);
  }
  
  protected void onSetValues(Particle paramParticle, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramParticle.setColor(paramFloat1, paramFloat2, paramFloat3);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.ColorModifier
 * JD-Core Version:    0.7.0.1
 */