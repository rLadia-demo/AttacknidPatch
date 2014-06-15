package org.anddev.andengine.entity.particle.emitter;

public abstract class BaseRectangleParticleEmitter
  extends BaseParticleEmitter
{
  protected float mHeight;
  protected float mHeightHalf;
  protected float mWidth;
  protected float mWidthHalf;
  
  public BaseRectangleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this(paramFloat1, paramFloat2, paramFloat3, paramFloat3);
  }
  
  public BaseRectangleParticleEmitter(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    super(paramFloat1, paramFloat2);
    setWidth(paramFloat3);
    setHeight(paramFloat4);
  }
  
  public float getHeight()
  {
    return this.mHeight;
  }
  
  public float getWidth()
  {
    return this.mWidth;
  }
  
  public void setHeight(float paramFloat)
  {
    this.mHeight = paramFloat;
    this.mHeightHalf = (0.5F * paramFloat);
  }
  
  public void setWidth(float paramFloat)
  {
    this.mWidth = paramFloat;
    this.mWidthHalf = (0.5F * paramFloat);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.particle.emitter.BaseRectangleParticleEmitter
 * JD-Core Version:    0.7.0.1
 */