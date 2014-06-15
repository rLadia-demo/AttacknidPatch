package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseSingleValueInitializer
  implements IParticleInitializer
{
  protected float mMaxValue;
  protected float mMinValue;
  
  public BaseSingleValueInitializer(float paramFloat1, float paramFloat2)
  {
    this.mMinValue = paramFloat1;
    this.mMaxValue = paramFloat2;
  }
  
  private final float getRandomValue()
  {
    if (this.mMinValue == this.mMaxValue) {
      return this.mMaxValue;
    }
    return MathUtils.RANDOM.nextFloat() * (this.mMaxValue - this.mMinValue) + this.mMinValue;
  }
  
  public void onInitializeParticle(Particle paramParticle)
  {
    onInitializeParticle(paramParticle, getRandomValue());
  }
  
  protected abstract void onInitializeParticle(Particle paramParticle, float paramFloat);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.BaseSingleValueInitializer
 * JD-Core Version:    0.7.0.1
 */