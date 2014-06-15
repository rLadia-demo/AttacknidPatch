package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public abstract class BaseSingleValueSpanModifier
  implements IParticleModifier
{
  private final float mDuration;
  private final float mFromTime;
  private final float mFromValue;
  private final float mSpanValue;
  private final float mToTime;
  private final float mToValue;
  
  public BaseSingleValueSpanModifier(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mFromValue = paramFloat1;
    this.mToValue = paramFloat2;
    this.mFromTime = paramFloat3;
    this.mToTime = paramFloat4;
    this.mSpanValue = (this.mToValue - this.mFromValue);
    this.mDuration = (this.mToTime - this.mFromTime);
  }
  
  protected final float calculateValue(float paramFloat)
  {
    return this.mFromValue + paramFloat * this.mSpanValue;
  }
  
  public void onInitializeParticle(Particle paramParticle)
  {
    onSetInitialValue(paramParticle, this.mFromValue);
  }
  
  protected abstract void onSetInitialValue(Particle paramParticle, float paramFloat);
  
  protected abstract void onSetValue(Particle paramParticle, float paramFloat);
  
  protected void onSetValueInternal(Particle paramParticle, float paramFloat)
  {
    onSetValue(paramParticle, calculateValue(paramFloat));
  }
  
  public void onUpdateParticle(Particle paramParticle)
  {
    float f = paramParticle.getLifeTime();
    if ((f > this.mFromTime) && (f < this.mToTime)) {
      onSetValueInternal(paramParticle, (f - this.mFromTime) / this.mDuration);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.BaseSingleValueSpanModifier
 * JD-Core Version:    0.7.0.1
 */