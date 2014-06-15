package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseCircleParticleEmitter
  extends BaseParticleEmitter
{
  protected float mRadiusX;
  protected float mRadiusY;
  
  public BaseCircleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat3);
  }
  
  public BaseCircleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2);
    setRadiusX(paramFloat3);
    setRadiusY(paramFloat4);
  }
  
  public float getRadiusX()
  {
    return this.mRadiusX;
  }
  
  public float getRadiusY()
  {
    return this.mRadiusY;
  }
  
  public void setRadius(float paramFloat)
  {
    this.mRadiusX = paramFloat;
    this.mRadiusY = paramFloat;
  }
  
  public void setRadius(float paramFloat1, float paramFloat2)
  {
    this.mRadiusX = paramFloat1;
    this.mRadiusY = paramFloat2;
  }
  
  public void setRadiusX(float paramFloat)
  {
    this.mRadiusX = paramFloat;
  }
  
  public void setRadiusY(float paramFloat)
  {
    this.mRadiusY = paramFloat;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.BaseCircleParticleEmitter
 * JD-Core Version:    0.7.0.1
 */