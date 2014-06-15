package org.anddev.andengine.entity.scene.menu.item.decorator;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.util.modifier.IModifier;

public abstract class BaseMenuItemDecorator
  implements IMenuItem
{
  private final IMenuItem mMenuItem;
  
  public BaseMenuItemDecorator(IMenuItem paramIMenuItem)
  {
    this.mMenuItem = paramIMenuItem;
  }
  
  public void accelerate(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.accelerate(paramFloat1, paramFloat2);
  }
  
  public void addShapeModifier(IModifier<IShape> paramIModifier)
  {
    this.mMenuItem.addShapeModifier(paramIModifier);
  }
  
  public void clearShapeModifiers()
  {
    this.mMenuItem.clearShapeModifiers();
  }
  
  public boolean collidesWith(IShape paramIShape)
  {
    return this.mMenuItem.collidesWith(paramIShape);
  }
  
  public boolean contains(float paramFloat1, float paramFloat2)
  {
    return this.mMenuItem.contains(paramFloat1, paramFloat2);
  }
  
  public float[] convertLocalToSceneCoordinates(float paramFloat1, float paramFloat2)
  {
    return this.mMenuItem.convertLocalToSceneCoordinates(paramFloat1, paramFloat2);
  }
  
  public float[] convertSceneToLocalCoordinates(float paramFloat1, float paramFloat2)
  {
    return this.mMenuItem.convertSceneToLocalCoordinates(paramFloat1, paramFloat2);
  }
  
  public float getAccelerationX()
  {
    return this.mMenuItem.getAccelerationX();
  }
  
  public float getAccelerationY()
  {
    return this.mMenuItem.getAccelerationY();
  }
  
  public float getAlpha()
  {
    return this.mMenuItem.getAlpha();
  }
  
  public float getAngularVelocity()
  {
    return this.mMenuItem.getAngularVelocity();
  }
  
  public float getBaseHeight()
  {
    return this.mMenuItem.getBaseHeight();
  }
  
  public float getBaseWidth()
  {
    return this.mMenuItem.getBaseWidth();
  }
  
  public float getBaseX()
  {
    return this.mMenuItem.getBaseX();
  }
  
  public float getBaseY()
  {
    return this.mMenuItem.getBaseY();
  }
  
  public float getBlue()
  {
    return this.mMenuItem.getBlue();
  }
  
  public float getGreen()
  {
    return this.mMenuItem.getGreen();
  }
  
  public float getHeight()
  {
    return this.mMenuItem.getHeight();
  }
  
  public float getHeightScaled()
  {
    return this.mMenuItem.getHeightScaled();
  }
  
  public int getID()
  {
    return this.mMenuItem.getID();
  }
  
  public float getRed()
  {
    return this.mMenuItem.getRed();
  }
  
  public float getRotation()
  {
    return this.mMenuItem.getRotation();
  }
  
  public float getRotationCenterX()
  {
    return this.mMenuItem.getRotationCenterX();
  }
  
  public float getRotationCenterY()
  {
    return this.mMenuItem.getRotationCenterY();
  }
  
  public float getScaleCenterX()
  {
    return this.mMenuItem.getScaleCenterX();
  }
  
  public float getScaleCenterY()
  {
    return this.mMenuItem.getScaleCenterY();
  }
  
  public float getScaleX()
  {
    return this.mMenuItem.getScaleX();
  }
  
  public float getScaleY()
  {
    return this.mMenuItem.getScaleY();
  }
  
  public float[] getSceneCenterCoordinates()
  {
    return this.mMenuItem.getSceneCenterCoordinates();
  }
  
  public float getVelocityX()
  {
    return this.mMenuItem.getVelocityX();
  }
  
  public float getVelocityY()
  {
    return this.mMenuItem.getVelocityY();
  }
  
  public float getWidth()
  {
    return this.mMenuItem.getWidth();
  }
  
  public float getWidthScaled()
  {
    return this.mMenuItem.getWidthScaled();
  }
  
  public float getX()
  {
    return this.mMenuItem.getX();
  }
  
  public float getY()
  {
    return this.mMenuItem.getY();
  }
  
  public int getZIndex()
  {
    return this.mMenuItem.getZIndex();
  }
  
  public boolean isCullingEnabled()
  {
    return this.mMenuItem.isCullingEnabled();
  }
  
  public boolean isScaled()
  {
    return this.mMenuItem.isScaled();
  }
  
  public boolean isUpdatePhysics()
  {
    return this.mMenuItem.isUpdatePhysics();
  }
  
  public boolean onAreaTouched(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    return this.mMenuItem.onAreaTouched(paramTouchEvent, paramFloat1, paramFloat2);
  }
  
  public void onDraw(GL10 paramGL10, Camera paramCamera)
  {
    this.mMenuItem.onDraw(paramGL10, paramCamera);
  }
  
  protected abstract void onMenuItemReset(IMenuItem paramIMenuItem);
  
  protected abstract void onMenuItemSelected(IMenuItem paramIMenuItem);
  
  protected abstract void onMenuItemUnselected(IMenuItem paramIMenuItem);
  
  public final void onSelected()
  {
    this.mMenuItem.onSelected();
    onMenuItemSelected(this.mMenuItem);
  }
  
  public final void onUnselected()
  {
    this.mMenuItem.onUnselected();
    onMenuItemUnselected(this.mMenuItem);
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mMenuItem.onUpdate(paramFloat);
  }
  
  public boolean removeShapeModifier(IModifier<IShape> paramIModifier)
  {
    return this.mMenuItem.removeShapeModifier(paramIModifier);
  }
  
  public void reset()
  {
    this.mMenuItem.reset();
    onMenuItemReset(this.mMenuItem);
  }
  
  public void setAcceleration(float paramFloat)
  {
    this.mMenuItem.setAcceleration(paramFloat);
  }
  
  public void setAcceleration(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setAcceleration(paramFloat1, paramFloat2);
  }
  
  public void setAccelerationX(float paramFloat)
  {
    this.mMenuItem.setAccelerationX(paramFloat);
  }
  
  public void setAccelerationY(float paramFloat)
  {
    this.mMenuItem.setAccelerationY(paramFloat);
  }
  
  public void setAlpha(float paramFloat)
  {
    this.mMenuItem.setAlpha(paramFloat);
  }
  
  public void setAngularVelocity(float paramFloat)
  {
    this.mMenuItem.setAngularVelocity(paramFloat);
  }
  
  public void setBasePosition()
  {
    this.mMenuItem.setBasePosition();
  }
  
  public void setBlendFunction(int paramInt1, int paramInt2)
  {
    this.mMenuItem.setBlendFunction(paramInt1, paramInt2);
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this.mMenuItem.setColor(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mMenuItem.setColor(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void setCullingEnabled(boolean paramBoolean)
  {
    this.mMenuItem.setCullingEnabled(paramBoolean);
  }
  
  public void setPosition(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setPosition(paramFloat1, paramFloat2);
  }
  
  public void setPosition(IShape paramIShape)
  {
    this.mMenuItem.setPosition(paramIShape);
  }
  
  public void setRotation(float paramFloat)
  {
    this.mMenuItem.setRotation(paramFloat);
  }
  
  public void setRotationCenter(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setRotationCenter(paramFloat1, paramFloat2);
  }
  
  public void setRotationCenterX(float paramFloat)
  {
    this.mMenuItem.setRotationCenterX(paramFloat);
  }
  
  public void setRotationCenterY(float paramFloat)
  {
    this.mMenuItem.setRotationCenterY(paramFloat);
  }
  
  public void setScale(float paramFloat)
  {
    this.mMenuItem.setScale(paramFloat);
  }
  
  public void setScale(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setScale(paramFloat1, paramFloat2);
  }
  
  public void setScaleCenter(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setScaleCenter(paramFloat1, paramFloat2);
  }
  
  public void setScaleCenterX(float paramFloat)
  {
    this.mMenuItem.setScaleCenterX(paramFloat);
  }
  
  public void setScaleCenterY(float paramFloat)
  {
    this.mMenuItem.setScaleCenterY(paramFloat);
  }
  
  public void setScaleX(float paramFloat)
  {
    this.mMenuItem.setScaleX(paramFloat);
  }
  
  public void setScaleY(float paramFloat)
  {
    this.mMenuItem.setScaleY(paramFloat);
  }
  
  public void setUpdatePhysics(boolean paramBoolean)
  {
    this.mMenuItem.setUpdatePhysics(paramBoolean);
  }
  
  public void setVelocity(float paramFloat)
  {
    this.mMenuItem.setVelocity(paramFloat);
  }
  
  public void setVelocity(float paramFloat1, float paramFloat2)
  {
    this.mMenuItem.setVelocity(paramFloat1, paramFloat2);
  }
  
  public void setVelocityX(float paramFloat)
  {
    this.mMenuItem.setVelocityX(paramFloat);
  }
  
  public void setVelocityY(float paramFloat)
  {
    this.mMenuItem.setVelocityY(paramFloat);
  }
  
  public void setZIndex(int paramInt)
  {
    this.mMenuItem.setZIndex(paramInt);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.item.decorator.BaseMenuItemDecorator
 * JD-Core Version:    0.7.0.1
 */