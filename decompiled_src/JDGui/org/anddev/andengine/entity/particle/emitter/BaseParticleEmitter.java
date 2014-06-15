package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseParticleEmitter
  implements IParticleEmitter
{
  protected float mCenterX;
  protected float mCenterY;
  
  public BaseParticleEmitter(float paramFloat1, float paramFloat2)
  {
    this.mCenterX = paramFloat1;
    this.mCenterY = paramFloat2;
  }
  
  public float getCenterX()
  {
    return this.mCenterX;
  }
  
  public float getCenterY()
  {
    return this.mCenterY;
  }
  
  public void onUpdate(float paramFloat) {}
  
  public void reset() {}
  
  public void setCenter(float paramFloat1, float paramFloat2)
  {
    this.mCenterX = paramFloat1;
    this.mCenterY = paramFloat2;
  }
  
  public void setCenterX(float paramFloat)
  {
    this.mCenterX = paramFloat;
  }
  
  public void setCenterY(float paramFloat)
  {
    this.mCenterY = paramFloat;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.BaseParticleEmitter
 * JD-Core Version:    0.7.0.1
 */