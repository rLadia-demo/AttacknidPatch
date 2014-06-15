package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public abstract class BaseTripleValueSpanModifier
  extends BaseDoubleValueSpanModifier
{
  private final float mFromValueC;
  private final float mSpanValueC;
  private final float mToValueC;
  
  public BaseTripleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat7, paramFloat8);
    this.mFromValueC = paramFloat5;
    this.mToValueC = paramFloat6;
    this.mSpanValueC = (this.mToValueC - this.mFromValueC);
  }
  
  private final float calculateValueC(float paramFloat)
  {
    return this.mFromValueC + paramFloat * this.mSpanValueC;
  }
  
  public void onSetInitialValues(Particle paramParticle, float paramFloat1, float paramFloat2)
  {
    onSetInitialValues(paramParticle, paramFloat1, paramFloat2, this.mFromValueC);
  }
  
  protected abstract void onSetInitialValues(Particle paramParticle, float paramFloat1, float paramFloat2, float paramFloat3);
  
  protected void onSetValueInternal(Particle paramParticle, float paramFloat)
  {
    onSetValues(paramParticle, super.calculateValue(paramFloat), super.calculateValueB(paramFloat), calculateValueC(paramFloat));
  }
  
  @Deprecated
  protected void onSetValues(Particle paramParticle, float paramFloat1, float paramFloat2) {}
  
  protected abstract void onSetValues(Particle paramParticle, float paramFloat1, float paramFloat2, float paramFloat3);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.BaseTripleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */