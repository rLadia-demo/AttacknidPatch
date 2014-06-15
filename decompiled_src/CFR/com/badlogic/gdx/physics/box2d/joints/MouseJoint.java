/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class MouseJoint
extends Joint {
    private final Vector2 target = new Vector2();
    final float[] tmp = new float[2];

    public MouseJoint(World world, long l) {
        super(world, l);
    }

    private native float jniGetDampingRatio(long var1);

    private native float jniGetFrequency(long var1);

    private native float jniGetMaxForce(long var1);

    private native void jniGetTarget(long var1, float[] var3);

    private native void jniSetDampingRatio(long var1, float var3);

    private native void jniSetFrequency(long var1, float var3);

    private native void jniSetMaxForce(long var1, float var3);

    private native void jniSetTarget(long var1, float var3, float var4);

    public float getDampingRatio() {
        return this.jniGetDampingRatio(this.addr);
    }

    public float getFrequency() {
        return this.jniGetFrequency(this.addr);
    }

    public float getMaxForce() {
        return this.jniGetMaxForce(this.addr);
    }

    public Vector2 getTarget() {
        this.jniGetTarget(this.addr, this.tmp);
        this.target.x = this.tmp[0];
        this.target.y = this.tmp[1];
        return this.target;
    }

    public void setDampingRatio(float f) {
        this.jniSetDampingRatio(this.addr, f);
    }

    public void setFrequency(float f) {
        this.jniSetFrequency(this.addr, f);
    }

    public void setMaxForce(float f) {
        this.jniSetMaxForce(this.addr, f);
    }

    public void setTarget(Vector2 vector2) {
        this.jniSetTarget(this.addr, vector2.x, vector2.y);
    }
}

