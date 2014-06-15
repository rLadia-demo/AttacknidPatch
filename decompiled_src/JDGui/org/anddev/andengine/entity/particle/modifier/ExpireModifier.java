package org.anddev.andengine.entity.particle.modifier;

import java.util.Random;
import org.anddev.andengine.entity.particle.Particle;
import org.anddev.andengine.util.MathUtils;

public class ExpireModifier
  implements IParticleModifier
{
  private float mMaxLifeTime;
  private float mMinLifeTime;
  
  public ExpireModifier(float paramFloat)
  {
    this(paramFloat, paramFloat);
  }
  
  public ExpireModifier(float paramFloat1, float paramFloat2)
  {
    this.mMinLifeTime = paramFloat1;
    this.mMaxLifeTime = paramFloat2;
  }
  
  public float getMaxLifeTime()
  {
    return this.mMaxLifeTime;
  }
  
  public float getMinLifeTime()
  {
    return this.mMinLifeTime;
  }
  
  public void onInitializeParticle(Particle paramParticle)
  {
    paramParticle.setDeathTime(MathUtils.RANDOM.nextFloat() * (this.mMaxLifeTime - this.mMinLifeTime) + this.mMinLifeTime);
  }
  
  public void onUpdateParticle(Particle paramParticle) {}
  
  public void setLifeTime(float paramFloat)
  {
    this.mMinLifeTime = paramFloat;
    this.mMaxLifeTime = paramFloat;
  }
  
  public void setLifeTime(float paramFloat1, float paramFloat2)
  {
    this.mMinLifeTime = paramFloat1;
    this.mMaxLifeTime = paramFloat2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.ExpireModifier
 * JD-Core Version:    0.7.0.1
 */