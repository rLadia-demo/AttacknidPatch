package org.anddev.andengine.entity.particle.modifier;

import org.anddev.andengine.entity.particle.Particle;

public class AccelerationInitializer
  extends BaseDoubleValueInitializer
{
  public AccelerationInitializer(float paramFloat)
  {
    this(paramFloat, paramFloat);
  }
  
  public AccelerationInitializer(float paramFloat1, float paramFloat2)
  {
    this(paramFloat1, paramFloat1, paramFloat2, paramFloat2);
  }
  
  public AccelerationInitializer(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public float getMaxAccelerationX()
  {
    return this.mMaxValue;
  }
  
  public float getMaxAccelerationY()
  {
    return this.mMaxValueB;
  }
  
  public float getMinAccelerationX()
  {
    return this.mMinValue;
  }
  
  public float getMinAccelerationY()
  {
    return this.mMinValueB;
  }
  
  public void onInitializeParticle(Particle paramParticle, float paramFloat1, float paramFloat2)
  {
    paramParticle.accelerate(paramFloat1, paramFloat2);
  }
  
  public void setAcceleration(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mMinValue = paramFloat1;
    this.mMaxValue = paramFloat2;
    this.mMinValueB = paramFloat3;
    this.mMaxValueB = paramFloat4;
  }
  
  public void setAccelerationX(float paramFloat)
  {
    this.mMinValue = paramFloat;
    this.mMaxValue = paramFloat;
  }
  
  public void setAccelerationX(float paramFloat1, float paramFloat2)
  {
    this.mMinValue = paramFloat1;
    this.mMaxValue = paramFloat2;
  }
  
  public void setAccelerationY(float paramFloat)
  {
    this.mMinValueB = paramFloat;
    this.mMaxValueB = paramFloat;
  }
  
  public void setAccelerationY(float paramFloat1, float paramFloat2)
  {
    this.mMinValueB = paramFloat1;
    this.mMaxValueB = paramFloat2;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.modifier.AccelerationInitializer
 * JD-Core Version:    0.7.0.1
 */