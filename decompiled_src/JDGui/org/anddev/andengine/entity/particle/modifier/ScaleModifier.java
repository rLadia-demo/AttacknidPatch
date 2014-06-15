package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class ScaleModifier
  extends BaseDoubleValueSpanModifier
{
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this(paramFloat1, paramFloat2, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public ScaleModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6);
  }
  
  protected void onSetInitialValues(Particle paramParticle, float paramFloat1, float paramFloat2)
  {
    paramParticle.setScale(paramFloat1, paramFloat2);
  }
  
  protected void onSetValues(Particle paramParticle, float paramFloat1, float paramFloat2)
  {
    paramParticle.setScale(paramFloat1, paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.ScaleModifier
 * JD-Core Version:    0.7.0.1
 */