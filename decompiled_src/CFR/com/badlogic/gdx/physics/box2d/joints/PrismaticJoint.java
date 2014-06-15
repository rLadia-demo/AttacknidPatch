/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class PrismaticJoint
extends Joint {
    public PrismaticJoint(World world, long l) {
        super(world, l);
    }

    private native void jniEnableLimit(long var1, boolean var3);

    private native void jniEnableMotor(long var1, boolean var3);

    private native float jniGetJointSpeed(long var1);

    private native float jniGetJointTranslation(long var1);

    private native float jniGetLowerLimit(long var1);

    private native float jniGetMotorForce(long var1);

    private native float jniGetMotorSpeed(long var1);

    private native float jniGetUpperLimit(long var1);

    private native boolean jniIsLimitEnabled(long var1);

    private native boolean jniIsMotorEnabled(long var1);

    private native void jniSetLimits(long var1, float var3, float var4);

    private native void jniSetMaxMotorForce(long var1, float var3);

    private native void jniSetMotorSpeed(long var1, float var3);

    public void enableLimit(boolean bl) {
        this.jniEnableLimit(this.addr, bl);
    }

    public void enableMotor(boolean bl) {
        this.jniEnableMotor(this.addr, bl);
    }

    public float getJointSpeed() {
        return this.jniGetJointSpeed(this.addr);
    }

    public float getJointTranslation() {
        return this.jniGetJointTranslation(this.addr);
    }

    public float getLowerLimit() {
        return this.jniGetLowerLimit(this.addr);
    }

    public float getMotorForce() {
        return this.jniGetMotorForce(this.addr);
    }

    public float getMotorSpeed() {
        return this.jniGetMotorSpeed(this.addr);
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

    public void setLimits(float f, float f2) {
        this.jniSetLimits(this.addr, f, f2);
    }

    public void setMaxMotorForce(float f) {
        this.jniSetMaxMotorForce(this.addr, f);
    }

    public void setMotorSpeed(float f) {
        this.jniSetMotorSpeed(this.addr, f);
    }
}

