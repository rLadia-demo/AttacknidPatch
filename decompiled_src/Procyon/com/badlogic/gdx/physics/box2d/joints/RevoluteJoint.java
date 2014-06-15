package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;

public class RevoluteJoint extends Joint
{
    public RevoluteJoint(final World world, final long n) {
        super(world, n);
    }
    
    private native void jniEnableLimit(final long p0, final boolean p1);
    
    private native void jniEnableMotor(final long p0, final boolean p1);
    
    private native float jniGetJointAngle(final long p0);
    
    private native float jniGetJointSpeed(final long p0);
    
    private native float jniGetLowerLimit(final long p0);
    
    private native float jniGetMotorSpeed(final long p0);
    
    private native float jniGetMotorTorque(final long p0);
    
    private native float jniGetUpperLimit(final long p0);
    
    private native boolean jniIsLimitEnabled(final long p0);
    
    private native boolean jniIsMotorEnabled(final long p0);
    
    private native void jniSetLimits(final long p0, final float p1, final float p2);
    
    private native void jniSetMaxMotorTorque(final long p0, final float p1);
    
    private native void jniSetMotorSpeed(final long p0, final float p1);
    
    public void enableLimit(final boolean b) {
        this.jniEnableLimit(this.addr, b);
    }
    
    public void enableMotor(final boolean b) {
        this.jniEnableMotor(this.addr, b);
    }
    
    public float getJointAngle() {
        return this.jniGetJointAngle(this.addr);
    }
    
    public float getJointSpeed() {
        return this.jniGetJointSpeed(this.addr);
    }
    
    public float getLowerLimit() {
        return this.jniGetLowerLimit(this.addr);
    }
    
    public float getMotorSpeed() {
        return this.jniGetMotorSpeed(this.addr);
    }
    
    public float getMotorTorque() {
        return this.jniGetMotorTorque(this.addr);
    }
    
    public float getUpperLimit() {
        return this.jniGetUpperLimit(this.addr);
    }
    
    public boolean isLimitEnabled() {
        return this.jniIsLimitEnabled(this.addr);
    }
    
    public boolean isMotorEnabled() {
        return this.jniIsMotorEnabled(this.addr);
    }
    
    public void setLimits(final float n, final float n2) {
        this.jniSetLimits(this.addr, n, n2);
    }
    
    public void setMaxMotorTorque(final float n) {
        this.jniSetMaxMotorTorque(this.addr, n);
    }
    
    public void setMotorSpeed(final float n) {
        this.jniSetMotorSpeed(this.addr, n);
    }
}
