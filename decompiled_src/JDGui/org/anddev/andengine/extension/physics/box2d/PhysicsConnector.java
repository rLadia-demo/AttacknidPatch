package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.extension.physics.box2d.util.constants.PhysicsConstants;
import org.anddev.andengine.util.MathUtils;

public class PhysicsConnector
  implements IUpdateHandler, PhysicsConstants
{
  protected final Body mBody;
  protected final float mPixelToMeterRatio;
  protected final Shape mShape;
  protected final float mShapeHalfBaseHeight;
  protected final float mShapeHalfBaseWidth;
  protected boolean mUpdateAngularVelocity;
  protected boolean mUpdateLinearVelocity;
  protected boolean mUpdatePosition;
  protected boolean mUpdateRotation;
  
  public PhysicsConnector(Shape paramShape, Body paramBody)
  {
    this(paramShape, paramBody, true, true, true, true);
  }
  
  public PhysicsConnector(Shape paramShape, Body paramBody, float paramFloat)
  {
    this(paramShape, paramBody, true, true, true, true, paramFloat);
  }
  
  public PhysicsConnector(Shape paramShape, Body paramBody, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    this(paramShape, paramBody, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, 32.0F);
  }
  
  public PhysicsConnector(Shape paramShape, Body paramBody, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, float paramFloat)
  {
    this.mShape = paramShape;
    this.mBody = paramBody;
    this.mUpdatePosition = paramBoolean1;
    this.mUpdateRotation = paramBoolean2;
    this.mUpdateLinearVelocity = paramBoolean3;
    this.mUpdateAngularVelocity = paramBoolean4;
    this.mPixelToMeterRatio = paramFloat;
    this.mShapeHalfBaseWidth = (0.5F * paramShape.getBaseWidth());
    this.mShapeHalfBaseHeight = (0.5F * paramShape.getBaseHeight());
  }
  
  public Body getBody()
  {
    return this.mBody;
  }
  
  public Shape getShape()
  {
    return this.mShape;
  }
  
  public boolean isUpdateAngularVelocity()
  {
    return this.mUpdateAngularVelocity;
  }
  
  public boolean isUpdateLinearVelocity()
  {
    return this.mUpdateLinearVelocity;
  }
  
  public boolean isUpdatePosition()
  {
    return this.mUpdatePosition;
  }
  
  public boolean isUpdateRotation()
  {
    return this.mUpdateRotation;
  }
  
  public void onUpdate(float paramFloat)
  {
    Shape localShape = this.mShape;
    Body localBody = this.mBody;
    if (this.mUpdatePosition)
    {
      Vector2 localVector22 = localBody.getPosition();
      float f = this.mPixelToMeterRatio;
      localShape.setPosition(f * localVector22.x - this.mShapeHalfBaseWidth, f * localVector22.y - this.mShapeHalfBaseHeight);
    }
    if (this.mUpdateRotation) {
      localShape.setRotation(MathUtils.radToDeg(localBody.getAngle()));
    }
    if (this.mUpdateLinearVelocity)
    {
      Vector2 localVector21 = localBody.getLinearVelocity();
      localShape.setVelocity(localVector21.x, localVector21.y);
    }
    if (this.mUpdateAngularVelocity) {
      localShape.setAngularVelocity(localBody.getAngularVelocity());
    }
  }
  
  public void reset() {}
  
  public void setUpdateAngularVelocity(boolean paramBoolean)
  {
    this.mUpdateAngularVelocity = paramBoolean;
  }
  
  public void setUpdateLinearVelocity(boolean paramBoolean)
  {
    this.mUpdateLinearVelocity = paramBoolean;
  }
  
  public void setUpdatePosition(boolean paramBoolean)
  {
    this.mUpdatePosition = paramBoolean;
  }
  
  public void setUpdateRotation(boolean paramBoolean)
  {
    this.mUpdateRotation = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.PhysicsConnector
 * JD-Core Version:    0.7.0.1
 */