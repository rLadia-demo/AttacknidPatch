package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public abstract class BaseDoubleValueSpanModifier
  extends BaseSingleValueSpanModifier
{
  private final float mFromValueB;
  private final float mSpanValueB;
  private final float mToValueB;
  
  public BaseDoubleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    super(paramFloat1, paramFloat2, paramFloat5, paramFloat6);
    this.mFromValueB = paramFloat3;
    this.mToValueB = paramFloat4;
    this.mSpanValueB = (this.mToValueB - this.mFromValueB);
  }
  
  protected final float calculateValueB(float paramFloat)
  {
    return this.mFromValueB + paramFloat * this.mSpanValueB;
  }
  
  public void onSetInitialValue(Particle paramParticle, float paramFloat)
  {
    onSetInitialValues(paramParticle, paramFloat, this.mFromValueB);
  }
  
  protected abstract void onSetInitialValues(Particle paramParticle, float paramFloat1, float paramFloat2);
  
  @Deprecated
  protected void onSetValue(Particle paramParticle, float paramFloat) {}
  
  protected void onSetValueInternal(Particle paramParticle, float paramFloat)
  {
    onSetValues(paramParticle, super.calculateValue(paramFloat), calculateValueB(paramFloat));
  }
  
  protected abstract void onSetValues(Particle paramParticle, float paramFloat1, float paramFloat2);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.BaseDoubleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */