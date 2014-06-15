package org.anddev.andengine.engine.camera;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.BaseCollisionChecker;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.MathUtils;

public class Camera
  implements IUpdateHandler
{
  protected static final float[] VERTICES_TOUCH_TMP = new float[2];
  protected float mCameraSceneRotation = 0.0F;
  private IShape mChaseShape;
  private float mFarZ = 1.0F;
  private HUD mHUD;
  private float mMaxX;
  private float mMaxY;
  private float mMinX;
  private float mMinY;
  private float mNearZ = -1.0F;
  protected float mRotation = 0.0F;
  
  public Camera(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mMinX = paramFloat1;
    this.mMaxX = (paramFloat1 + paramFloat3);
    this.mMinY = paramFloat2;
    this.mMaxY = (paramFloat2 + paramFloat4);
  }
  
  private void applyCameraSceneRotation(TouchEvent paramTouchEvent)
  {
    float f = -this.mCameraSceneRotation;
    if (f != 0.0F)
    {
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.rotateAroundCenter(VERTICES_TOUCH_TMP, f, 0.5F * (this.mMaxX - this.mMinX), 0.5F * (this.mMaxY - this.mMinY));
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
  }
  
  private void applyRotation(GL10 paramGL10, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    paramGL10.glTranslatef(paramFloat1, paramFloat2, 0.0F);
    paramGL10.glRotatef(paramFloat3, 0.0F, 0.0F, 1.0F);
    paramGL10.glTranslatef(-paramFloat1, -paramFloat2, 0.0F);
  }
  
  private void applySceneRotation(TouchEvent paramTouchEvent)
  {
    float f = -this.mRotation;
    if (f != 0.0F)
    {
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.rotateAroundCenter(VERTICES_TOUCH_TMP, f, getCenterX(), getCenterY());
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
  }
  
  private void convertAxisAlignedSurfaceToSceneTouchEvent(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    float f1 = getMinX();
    float f2 = getMaxX();
    float f3 = getMinY();
    float f4 = getMaxY();
    paramTouchEvent.set(f1 + paramFloat1 * (f2 - f1), f3 + paramFloat2 * (f4 - f3));
  }
  
  private void unapplyCameraSceneRotation(TouchEvent paramTouchEvent)
  {
    float f = -this.mCameraSceneRotation;
    if (f != 0.0F)
    {
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.revertRotateAroundCenter(VERTICES_TOUCH_TMP, f, 0.5F * (this.mMaxX - this.mMinX), 0.5F * (this.mMaxY - this.mMinY));
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
  }
  
  private void unapplySceneRotation(TouchEvent paramTouchEvent)
  {
    float f = this.mRotation;
    if (f != 0.0F)
    {
      VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
      VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
      MathUtils.revertRotateAroundCenter(VERTICES_TOUCH_TMP, f, getCenterX(), getCenterY());
      paramTouchEvent.set(VERTICES_TOUCH_TMP[0], VERTICES_TOUCH_TMP[1]);
    }
  }
  
  protected void applySceneToCameraSceneOffset(TouchEvent paramTouchEvent)
  {
    paramTouchEvent.offset(-this.mMinX, -this.mMinY);
  }
  
  public void convertCameraSceneToSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    unapplyCameraSceneRotation(paramTouchEvent);
    unapplySceneToCameraSceneOffset(paramTouchEvent);
    applySceneRotation(paramTouchEvent);
  }
  
  public void convertSceneToCameraSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    unapplySceneRotation(paramTouchEvent);
    applySceneToCameraSceneOffset(paramTouchEvent);
    applyCameraSceneRotation(paramTouchEvent);
  }
  
  public void convertSurfaceToSceneTouchEvent(TouchEvent paramTouchEvent, int paramInt1, int paramInt2)
  {
    float f1 = this.mRotation;
    float f2;
    float f3;
    if (f1 == 0.0F)
    {
      f2 = paramTouchEvent.getX() / paramInt1;
      f3 = paramTouchEvent.getY() / paramInt2;
    }
    for (;;)
    {
      convertAxisAlignedSurfaceToSceneTouchEvent(paramTouchEvent, f2, f3);
      return;
      if (f1 == 180.0F)
      {
        f2 = 1.0F - paramTouchEvent.getX() / paramInt1;
        f3 = 1.0F - paramTouchEvent.getY() / paramInt2;
      }
      else
      {
        VERTICES_TOUCH_TMP[0] = paramTouchEvent.getX();
        VERTICES_TOUCH_TMP[1] = paramTouchEvent.getY();
        MathUtils.rotateAroundCenter(VERTICES_TOUCH_TMP, f1, paramInt1 / 2, paramInt2 / 2);
        f2 = VERTICES_TOUCH_TMP[0] / paramInt1;
        f3 = VERTICES_TOUCH_TMP[1] / paramInt2;
      }
    }
  }
  
  public float getCameraSceneRotation()
  {
    return this.mCameraSceneRotation;
  }
  
  public float getCenterX()
  {
    float f = this.mMinX;
    return f + 0.5F * (this.mMaxX - f);
  }
  
  public float getCenterY()
  {
    float f = this.mMinY;
    return f + 0.5F * (this.mMaxY - f);
  }
  
  public float getFarZClippingPlane()
  {
    return this.mFarZ;
  }
  
  public HUD getHUD()
  {
    return this.mHUD;
  }
  
  public float getHeight()
  {
    return this.mMaxY - this.mMinY;
  }
  
  public float getMaxX()
  {
    return this.mMaxX;
  }
  
  public float getMaxY()
  {
    return this.mMaxY;
  }
  
  public float getMinX()
  {
    return this.mMinX;
  }
  
  public float getMinY()
  {
    return this.mMinY;
  }
  
  public float getNearZClippingPlane()
  {
    return this.mNearZ;
  }
  
  public float getRotation()
  {
    return this.mRotation;
  }
  
  public float getWidth()
  {
    return this.mMaxX - this.mMinX;
  }
  
  public boolean hasHUD()
  {
    return this.mHUD != null;
  }
  
  public boolean isRectangularShapeVisible(RectangularShape paramRectangularShape)
  {
    float f1 = paramRectangularShape.getX();
    float f2 = paramRectangularShape.getY();
    float f3 = f1 + paramRectangularShape.getWidthScaled();
    float f4 = f2 + paramRectangularShape.getHeightScaled();
    return BaseCollisionChecker.checkAxisAlignedRectangleCollision(getMinX(), getMinY(), getMaxX(), getMaxY(), f1, f2, f3, f4);
  }
  
  public void offsetCenter(float paramFloat1, float paramFloat2)
  {
    setCenter(paramFloat1 + getCenterX(), paramFloat2 + getCenterY());
  }
  
  public void onApplyCameraSceneMatrix(GL10 paramGL10)
  {
    GLHelper.setProjectionIdentityMatrix(paramGL10);
    float f1 = this.mMaxX - this.mMinX;
    float f2 = this.mMaxY - this.mMinY;
    paramGL10.glOrthof(0.0F, f1, f2, 0.0F, this.mNearZ, this.mFarZ);
    float f3 = this.mCameraSceneRotation;
    if (f3 != 0.0F) {
      applyRotation(paramGL10, f1 * 0.5F, f2 * 0.5F, f3);
    }
  }
  
  public void onApplyMatrix(GL10 paramGL10)
  {
    GLHelper.setProjectionIdentityMatrix(paramGL10);
    paramGL10.glOrthof(getMinX(), getMaxX(), getMaxY(), getMinY(), this.mNearZ, this.mFarZ);
    float f = this.mRotation;
    if (f != 0.0F) {
      applyRotation(paramGL10, getCenterX(), getCenterY(), f);
    }
  }
  
  public void onApplyPositionIndependentMatrix(GL10 paramGL10)
  {
    GLHelper.setProjectionIdentityMatrix(paramGL10);
    float f1 = this.mMaxX - this.mMinX;
    float f2 = this.mMaxY - this.mMinY;
    paramGL10.glOrthof(0.0F, f1, f2, 0.0F, this.mNearZ, this.mFarZ);
    float f3 = this.mRotation;
    if (f3 != 0.0F) {
      applyRotation(paramGL10, f1 * 0.5F, f2 * 0.5F, f3);
    }
  }
  
  public void onDrawHUD(GL10 paramGL10)
  {
    if (this.mHUD != null) {
      this.mHUD.onDraw(paramGL10, this);
    }
  }
  
  public void onUpdate(float paramFloat)
  {
    if (this.mHUD != null) {
      this.mHUD.onUpdate(paramFloat);
    }
    if (this.mChaseShape != null)
    {
      float[] arrayOfFloat = this.mChaseShape.getSceneCenterCoordinates();
      setCenter(arrayOfFloat[0], arrayOfFloat[1]);
    }
  }
  
  public void reset() {}
  
  public void setCameraSceneRotation(float paramFloat)
  {
    this.mCameraSceneRotation = paramFloat;
  }
  
  public void setCenter(float paramFloat1, float paramFloat2)
  {
    float f1 = paramFloat1 - getCenterX();
    float f2 = paramFloat2 - getCenterY();
    this.mMinX = (f1 + this.mMinX);
    this.mMaxX = (f1 + this.mMaxX);
    this.mMinY = (f2 + this.mMinY);
    this.mMaxY = (f2 + this.mMaxY);
  }
  
  public void setChaseShape(IShape paramIShape)
  {
    this.mChaseShape = paramIShape;
  }
  
  public void setFarZClippingPlane(float paramFloat)
  {
    this.mFarZ = paramFloat;
  }
  
  public void setHUD(HUD paramHUD)
  {
    this.mHUD = paramHUD;
    paramHUD.setCamera(this);
  }
  
  public void setNearZClippingPlane(float paramFloat)
  {
    this.mNearZ = paramFloat;
  }
  
  public void setRotation(float paramFloat)
  {
    this.mRotation = paramFloat;
  }
  
  public void setZClippingPlanes(float paramFloat1, float paramFloat2)
  {
    this.mNearZ = paramFloat1;
    this.mFarZ = paramFloat2;
  }
  
  protected void unapplySceneToCameraSceneOffset(TouchEvent paramTouchEvent)
  {
    paramTouchEvent.offset(this.mMinX, this.mMinY);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.camera.Camera
 * JD-Core Version:    0.7.0.1
 */