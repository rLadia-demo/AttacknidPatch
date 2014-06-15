package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class LineJoint
  extends Joint
{
  public LineJoint(World paramWorld, long paramLong)
  {
    super(paramWorld, paramLong);
  }
  
  private native void jniEnableLimit(long paramLong, boolean paramBoolean);
  
  private native void jniEnableMotor(long paramLong, boolean paramBoolean);
  
  private native float jniGetJointSpeed(long paramLong);
  
  private native float jniGetJointTranslation(long paramLong);
  
  private native float jniGetLowerLimit(long paramLong);
  
  private native float jniGetMaxMotorForce(long paramLong);
  
  private native float jniGetMotorForce(long paramLong);
  
  private native float jniGetMotorSpeed(long paramLong);
  
  private native float jniGetUpperLimit(long paramLong);
  
  private native boolean jniIsLimitEnabled(long paramLong);
  
  private native boolean jniIsMotorEnabled(long paramLong);
  
  private native void jniSetLimits(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetMaxMotorForce(long paramLong, float paramFloat);
  
  private native void jniSetMotorSpeed(long paramLong, float paramFloat);
  
  public void enableLimit(boolean paramBoolean)
  {
    jniEnableLimit(this.addr, paramBoolean);
  }
  
  public void enableMotor(boolean paramBoolean)
  {
    jniEnableMotor(this.addr, paramBoolean);
  }
  
  public float getJointSpeed()
  {
    return jniGetJointSpeed(this.addr);
  }
  
  public float getJointTranslation()
  {
    return jniGetJointTranslation(this.addr);
  }
  
  public float getLowerLimit()
  {
    return jniGetLowerLimit(this.addr);
  }
  
  public float getMaxMotorForce()
  {
    return jniGetMaxMotorForce(this.addr);
  }
  
  public float getMotorForce()
  {
    return jniGetMotorForce(this.addr);
  }
  
  public float getMotorSpeed()
  {
    return jniGetMotorSpeed(this.addr);
  }
  
  public float getUpperLimit()
  {
    return jniGetUpperLimit(this.addr);
  }
  
  public boolean isLimitEnabled()
  {
    return jniIsLimitEnabled(this.addr);
  }
  
  public boolean isMotorEnabled()
  {
    return jniIsMotorEnabled(this.addr);
  }
  
  public void setLimits(float paramFloat1, float paramFloat2)
  {
    jniSetLimits(this.addr, paramFloat1, paramFloat2);
  }
  
  public void setMaxMotorForce(float paramFloat)
  {
    jniSetMaxMotorForce(this.addr, paramFloat);
  }
  
  public void setMotorSpeed(float paramFloat)
  {
    jniSetMotorSpeed(this.addr, paramFloat);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.joints.LineJoint
 * JD-Core Version:    0.7.0.1
 */