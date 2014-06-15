package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class VelocityInitializer
  extends BaseDoubleValueInitializer
{
  public VelocityInitializer(float paramFloat)
  {
    this(paramFloat, paramFloat, paramFloat, paramFloat);
  }
  
  public VelocityInitializer(float paramFloat1, float paramFloat2)
  {
    this(paramFloat1, paramFloat1, paramFloat2, paramFloat2);
  }
  
  public VelocityInitializer(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public float getMaxVelocityX()
  {
    return this.mMaxValue;
  }
  
  public float getMaxVelocityY()
  {
    return this.mMaxValueB;
  }
  
  public float getMinVelocityX()
  {
    return this.mMinValue;
  }
  
  public float getMinVelocityY()
  {
    return this.mMinValueB;
  }
  
  public void onInitializeParticle(Particle paramParticle, float paramFloat1, float paramFloat2)
  {
    paramParticle.setVelocity(paramFloat1, paramFloat2);
  }
  
  public void setVelocity(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mMinValue = paramFloat1;
    this.mMaxValue = paramFloat2;
    this.mMinValueB = paramFloat3;
    this.mMaxValueB = paramFloat4;
  }
  
  public void setVelocityX(float paramFloat)
  {
    this.mMinValue = paramFloat;
    this.mMaxValue = paramFloat;
  }
  
  public void setVelocityX(float paramFloat1, float paramFloat2)
  {
    this.mMinValue = paramFloat1;
    this.mMaxValue = paramFloat2;
  }
  
  public void setVelocityY(float paramFloat)
  {
    this.mMinValueB = paramFloat;
    this.mMaxValueB = paramFloat;
  }
  
  public void setVelocityY(float paramFloat1, float paramFloat2)
  {
    this.mMinValueB = paramFloat1;
    this.mMaxValueB = paramFloat2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.VelocityInitializer
 * JD-Core Version:    0.7.0.1
 */