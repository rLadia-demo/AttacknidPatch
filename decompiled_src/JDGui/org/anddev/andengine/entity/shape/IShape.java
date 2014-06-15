package org.anddev.andengine.entity.shape;

import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.Scene.ITouchArea;
import org.anddev.andengine.util.modifier.IModifier;

public abstract interface IShape
  extends IEntity, Scene.ITouchArea
{
  public abstract void accelerate(float paramFloat1, float paramFloat2);
  
  public abstract void addShapeModifier(IModifier<IShape> paramIModifier);
  
  public abstract void clearShapeModifiers();
  
  public abstract boolean collidesWith(IShape paramIShape);
  
  public abstract float getAccelerationX();
  
  public abstract float getAccelerationY();
  
  public abstract float getAlpha();
  
  public abstract float getAngularVelocity();
  
  public abstract float getBaseHeight();
  
  public abstract float getBaseWidth();
  
  public abstract float getBaseX();
  
  public abstract float getBaseY();
  
  public abstract float getBlue();
  
  public abstract float getGreen();
  
  public abstract float getHeight();
  
  public abstract float getHeightScaled();
  
  public abstract float getRed();
  
  public abstract float getRotation();
  
  public abstract float getRotationCenterX();
  
  public abstract float getRotationCenterY();
  
  public abstract float getScaleCenterX();
  
  public abstract float getScaleCenterY();
  
  public abstract float getScaleX();
  
  public abstract float getScaleY();
  
  public abstract float[] getSceneCenterCoordinates();
  
  public abstract float getVelocityX();
  
  public abstract float getVelocityY();
  
  public abstract float getWidth();
  
  public abstract float getWidthScaled();
  
  public abstract float getX();
  
  public abstract float getY();
  
  public abstract boolean isCullingEnabled();
  
  public abstract boolean isScaled();
  
  public abstract boolean isUpdatePhysics();
  
  public abstract boolean removeShapeModifier(IModifier<IShape> paramIModifier);
  
  public abstract void setAcceleration(float paramFloat);
  
  public abstract void setAcceleration(float paramFloat1, float paramFloat2);
  
  public abstract void setAccelerationX(float paramFloat);
  
  public abstract void setAccelerationY(float paramFloat);
  
  public abstract void setAlpha(float paramFloat);
  
  public abstract void setAngularVelocity(float paramFloat);
  
  public abstract void setBasePosition();
  
  public abstract void setBlendFunction(int paramInt1, int paramInt2);
  
  public abstract void setColor(float paramFloat1, float paramFloat2, float paramFloat3);
  
  public abstract void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void setCullingEnabled(boolean paramBoolean);
  
  public abstract void setPosition(float paramFloat1, float paramFloat2);
  
  public abstract void setPosition(IShape paramIShape);
  
  public abstract void setRotation(float paramFloat);
  
  public abstract void setRotationCenter(float paramFloat1, float paramFloat2);
  
  public abstract void setRotationCenterX(float paramFloat);
  
  public abstract void setRotationCenterY(float paramFloat);
  
  public abstract void setScale(float paramFloat);
  
  public abstract void setScale(float paramFloat1, float paramFloat2);
  
  public abstract void setScaleCenter(float paramFloat1, float paramFloat2);
  
  public abstract void setScaleCenterX(float paramFloat);
  
  public abstract void setScaleCenterY(float paramFloat);
  
  public abstract void setScaleX(float paramFloat);
  
  public abstract void setScaleY(float paramFloat);
  
  public abstract void setUpdatePhysics(boolean paramBoolean);
  
  public abstract void setVelocity(float paramFloat);
  
  public abstract void setVelocity(float paramFloat1, float paramFloat2);
  
  public abstract void setVelocityX(float paramFloat);
  
  public abstract void setVelocityY(float paramFloat);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.IShape
 * JD-Core Version:    0.7.0.1
 */