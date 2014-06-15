package org.anddev.andengine.entity.shape;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ModifierList;

public abstract class Shape
  extends Entity
  implements IShape
{
  public static final int BLENDFUNCTION_DESTINATION_DEFAULT = 771;
  public static final int BLENDFUNCTION_DESTINATION_PREMULTIPLYALPHA_DEFAULT = 771;
  public static final int BLENDFUNCTION_SOURCE_DEFAULT = 770;
  public static final int BLENDFUNCTION_SOURCE_PREMULTIPLYALPHA_DEFAULT = 1;
  protected float mAccelerationX = 0.0F;
  protected float mAccelerationY = 0.0F;
  protected float mAlpha = 1.0F;
  protected float mAngularVelocity = 0.0F;
  private final float mBaseX;
  private final float mBaseY;
  protected float mBlue = 1.0F;
  private boolean mCullingEnabled = false;
  protected int mDestinationBlendFunction = 771;
  protected float mGreen = 1.0F;
  protected float mRed = 1.0F;
  protected float mRotation = 0.0F;
  protected float mRotationCenterX = 0.0F;
  protected float mRotationCenterY = 0.0F;
  protected float mScaleCenterX = 0.0F;
  protected float mScaleCenterY = 0.0F;
  protected float mScaleX = 1.0F;
  protected float mScaleY = 1.0F;
  private final ModifierList<IShape> mShapeModifiers = new ModifierList(this);
  protected int mSourceBlendFunction = 770;
  private boolean mUpdatePhysics = true;
  protected float mVelocityX = 0.0F;
  protected float mVelocityY = 0.0F;
  protected float mX;
  protected float mY;
  
  public Shape(float paramFloat1, float paramFloat2)
  {
    this.mBaseX = paramFloat1;
    this.mBaseY = paramFloat2;
    this.mX = paramFloat1;
    this.mY = paramFloat2;
  }
  
  public void accelerate(float paramFloat1, float paramFloat2)
  {
    this.mAccelerationX = (paramFloat1 + this.mAccelerationX);
    this.mAccelerationY = (paramFloat2 + this.mAccelerationY);
  }
  
  public void addShapeModifier(IModifier<IShape> paramIModifier)
  {
    this.mShapeModifiers.add(paramIModifier);
  }
  
  protected void applyRotation(GL10 paramGL10)
  {
    float f1 = this.mRotation;
    if (f1 != 0.0F)
    {
      float f2 = this.mRotationCenterX;
      float f3 = this.mRotationCenterY;
      paramGL10.glTranslatef(f2, f3, 0.0F);
      paramGL10.glRotatef(f1, 0.0F, 0.0F, 1.0F);
      paramGL10.glTranslatef(-f2, -f3, 0.0F);
    }
  }
  
  protected void applyScale(GL10 paramGL10)
  {
    float f1 = this.mScaleX;
    float f2 = this.mScaleY;
    if ((f1 != 1.0F) || (f2 != 1.0F))
    {
      float f3 = this.mScaleCenterX;
      float f4 = this.mScaleCenterY;
      paramGL10.glTranslatef(f3, f4, 0.0F);
      paramGL10.glScalef(f1, f2, 1.0F);
      paramGL10.glTranslatef(-f3, -f4, 0.0F);
    }
  }
  
  protected void applyTranslation(GL10 paramGL10)
  {
    paramGL10.glTranslatef(this.mX, this.mY, 0.0F);
  }
  
  public void clearShapeModifiers()
  {
    this.mShapeModifiers.clear();
  }
  
  protected abstract void drawVertices(GL10 paramGL10, Camera paramCamera);
  
  public float getAccelerationX()
  {
    return this.mAccelerationX;
  }
  
  public float getAccelerationY()
  {
    return this.mAccelerationY;
  }
  
  public float getAlpha()
  {
    return this.mAlpha;
  }
  
  public float getAngularVelocity()
  {
    return this.mAngularVelocity;
  }
  
  public float getBaseX()
  {
    return this.mBaseX;
  }
  
  public float getBaseY()
  {
    return this.mBaseY;
  }
  
  public float getBlue()
  {
    return this.mBlue;
  }
  
  public float getGreen()
  {
    return this.mGreen;
  }
  
  public float getHeightScaled()
  {
    return getHeight() * this.mScaleY;
  }
  
  public float getRed()
  {
    return this.mRed;
  }
  
  public float getRotation()
  {
    return this.mRotation;
  }
  
  public float getRotationCenterX()
  {
    return this.mRotationCenterX;
  }
  
  public float getRotationCenterY()
  {
    return this.mRotationCenterY;
  }
  
  public float getScaleCenterX()
  {
    return this.mScaleCenterX;
  }
  
  public float getScaleCenterY()
  {
    return this.mScaleCenterY;
  }
  
  public float getScaleX()
  {
    return this.mScaleX;
  }
  
  public float getScaleY()
  {
    return this.mScaleY;
  }
  
  public float getVelocityX()
  {
    return this.mVelocityX;
  }
  
  public float getVelocityY()
  {
    return this.mVelocityY;
  }
  
  public float getWidthScaled()
  {
    return getWidth() * this.mScaleX;
  }
  
  public float getX()
  {
    return this.mX;
  }
  
  public float getY()
  {
    return this.mY;
  }
  
  protected abstract boolean isCulled(Camera paramCamera);
  
  public boolean isCullingEnabled()
  {
    return this.mCullingEnabled;
  }
  
  public boolean isScaled()
  {
    return (this.mScaleX != 1.0F) || (this.mScaleY != 1.0F);
  }
  
  public boolean isUpdatePhysics()
  {
    return this.mUpdatePhysics;
  }
  
  protected void onApplyTransformations(GL10 paramGL10)
  {
    applyTranslation(paramGL10);
    applyRotation(paramGL10);
    applyScale(paramGL10);
  }
  
  protected abstract void onApplyVertices(GL10 paramGL10);
  
  public boolean onAreaTouched(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2)
  {
    return false;
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    GLHelper.setColor(paramGL10, this.mRed, this.mGreen, this.mBlue, this.mAlpha);
    GLHelper.enableVertexArray(paramGL10);
    GLHelper.blendFunction(paramGL10, this.mSourceBlendFunction, this.mDestinationBlendFunction);
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    if ((!this.mCullingEnabled) || (!isCulled(paramCamera)))
    {
      onInitDraw(paramGL10);
      paramGL10.glPushMatrix();
      onApplyVertices(paramGL10);
      onApplyTransformations(paramGL10);
      drawVertices(paramGL10, paramCamera);
      paramGL10.glPopMatrix();
    }
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    if (this.mUpdatePhysics)
    {
      float f1 = this.mAccelerationX;
      float f2 = this.mAccelerationY;
      if ((f1 != 0.0F) || (f2 != 0.0F))
      {
        this.mVelocityX += f1 * paramFloat;
        this.mVelocityY += f2 * paramFloat;
      }
      float f3 = this.mAngularVelocity;
      if (f3 != 0.0F) {
        this.mRotation += f3 * paramFloat;
      }
      float f4 = this.mVelocityX;
      float f5 = this.mVelocityY;
      if ((f4 != 0.0F) || (f5 != 0.0F))
      {
        this.mX += f4 * paramFloat;
        this.mY += f5 * paramFloat;
        onPositionChanged();
      }
    }
    this.mShapeModifiers.onUpdate(paramFloat);
  }
  
  protected void onPositionChanged() {}
  
  public boolean removeShapeModifier(IModifier<IShape> paramIModifier)
  {
    return this.mShapeModifiers.remove(paramIModifier);
  }
  
  public void reset()
  {
    super.reset();
    this.mX = this.mBaseX;
    this.mY = this.mBaseY;
    this.mAccelerationX = 0.0F;
    this.mAccelerationY = 0.0F;
    this.mVelocityX = 0.0F;
    this.mVelocityY = 0.0F;
    this.mRotation = 0.0F;
    this.mAngularVelocity = 0.0F;
    this.mScaleX = 1.0F;
    this.mScaleY = 1.0F;
    onPositionChanged();
    this.mRed = 1.0F;
    this.mGreen = 1.0F;
    this.mBlue = 1.0F;
    this.mAlpha = 1.0F;
    this.mSourceBlendFunction = 770;
    this.mDestinationBlendFunction = 771;
    this.mShapeModifiers.reset();
  }
  
  public void setAcceleration(float paramFloat)
  {
    this.mAccelerationX = paramFloat;
    this.mAccelerationY = paramFloat;
  }
  
  public void setAcceleration(float paramFloat1, float paramFloat2)
  {
    this.mAccelerationX = paramFloat1;
    this.mAccelerationY = paramFloat2;
  }
  
  public void setAccelerationX(float paramFloat)
  {
    this.mAccelerationX = paramFloat;
  }
  
  public void setAccelerationY(float paramFloat)
  {
    this.mAccelerationY = paramFloat;
  }
  
  public void setAlpha(float paramFloat)
  {
    this.mAlpha = paramFloat;
  }
  
  public void setAngularVelocity(float paramFloat)
  {
    this.mAngularVelocity = paramFloat;
  }
  
  public void setBasePosition()
  {
    this.mX = this.mBaseX;
    this.mY = this.mBaseY;
    onPositionChanged();
  }
  
  public void setBlendFunction(int paramInt1, int paramInt2)
  {
    this.mSourceBlendFunction = paramInt1;
    this.mDestinationBlendFunction = paramInt2;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    this.mRed = paramFloat1;
    this.mGreen = paramFloat2;
    this.mBlue = paramFloat3;
  }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mRed = paramFloat1;
    this.mGreen = paramFloat2;
    this.mBlue = paramFloat3;
    this.mAlpha = paramFloat4;
  }
  
  public void setCullingEnabled(boolean paramBoolean)
  {
    this.mCullingEnabled = paramBoolean;
  }
  
  public void setPosition(float paramFloat1, float paramFloat2)
  {
    this.mX = paramFloat1;
    this.mY = paramFloat2;
    onPositionChanged();
  }
  
  public void setPosition(IShape paramIShape)
  {
    setPosition(paramIShape.getX(), paramIShape.getY());
  }
  
  public void setRotation(float paramFloat)
  {
    this.mRotation = paramFloat;
  }
  
  public void setRotationCenter(float paramFloat1, float paramFloat2)
  {
    this.mRotationCenterX = paramFloat1;
    this.mRotationCenterY = paramFloat2;
  }
  
  public void setRotationCenterX(float paramFloat)
  {
    this.mRotationCenterX = paramFloat;
  }
  
  public void setRotationCenterY(float paramFloat)
  {
    this.mRotationCenterY = paramFloat;
  }
  
  public void setScale(float paramFloat)
  {
    this.mScaleX = paramFloat;
    this.mScaleY = paramFloat;
  }
  
  public void setScale(float paramFloat1, float paramFloat2)
  {
    this.mScaleX = paramFloat1;
    this.mScaleY = paramFloat2;
  }
  
  public void setScaleCenter(float paramFloat1, float paramFloat2)
  {
    this.mScaleCenterX = paramFloat1;
    this.mScaleCenterY = paramFloat2;
  }
  
  public void setScaleCenterX(float paramFloat)
  {
    this.mScaleCenterX = paramFloat;
  }
  
  public void setScaleCenterY(float paramFloat)
  {
    this.mScaleCenterY = paramFloat;
  }
  
  public void setScaleX(float paramFloat)
  {
    this.mScaleX = paramFloat;
  }
  
  public void setScaleY(float paramFloat)
  {
    this.mScaleY = paramFloat;
  }
  
  public void setUpdatePhysics(boolean paramBoolean)
  {
    this.mUpdatePhysics = paramBoolean;
  }
  
  public void setVelocity(float paramFloat)
  {
    this.mVelocityX = paramFloat;
    this.mVelocityY = paramFloat;
  }
  
  public void setVelocity(float paramFloat1, float paramFloat2)
  {
    this.mVelocityX = paramFloat1;
    this.mVelocityY = paramFloat2;
  }
  
  public void setVelocityX(float paramFloat)
  {
    this.mVelocityX = paramFloat;
  }
  
  public void setVelocityY(float paramFloat)
  {
    this.mVelocityY = paramFloat;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.shape.Shape
 * JD-Core Version:    0.7.0.1
 */