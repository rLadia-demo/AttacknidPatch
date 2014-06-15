package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.util.MathUtils;

public abstract class BaseDoubleValueInitializer
  extends BaseSingleValueInitializer
{
  protected float mMaxValueB;
  protected float mMinValueB;
  
  public BaseDoubleValueInitializer(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2);
    this.mMinValueB = paramFloat3;
    this.mMaxValueB = paramFloat4;
  }
  
  private final float getRandomValueB()
  {
    if (this.mMinValueB == this.mMaxValueB) {
      return this.mMaxValueB;
    }
    return MathUtils.RANDOM.nextFloat() * (this.mMaxValueB - this.mMinValueB) + this.mMinValueB;
  }
  
  protected void onInitializeParticle(Particle paramParticle, float paramFloat)
  {
    onInitializeParticle(paramParticle, paramFloat, getRandomValueB());
  }
  
  protected abstract void onInitializeParticle(Particle paramParticle, float paramFloat1, float paramFloat2);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.BaseDoubleValueInitializer
 * JD-Core Version:    0.7.0.1
 */