package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class MouseJoint extends Joint
{
    private final Vector2 target;
    final float[] tmp;
    
    public MouseJoint(final World world, final long n) {
        super(world, n);
        this.tmp = new float[2];
        this.target = new Vector2();
    }
    
    private native float jniGetDampingRatio(final long p0);
    
    private native float jniGetFrequency(final long p0);
    
    private native float jniGetMaxForce(final long p0);
    
    private native void jniGetTarget(final long p0, final float[] p1);
    
    private native void jniSetDampingRatio(final long p0, final float p1);
    
    private native void jniSetFrequency(final long p0, final float p1);
    
    private native void jniSetMaxForce(final long p0, final float p1);
    
    private native void jniSetTarget(final long p0, final float p1, final float p2);
    
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
    
    public void setDampingRatio(final float n) {
        this.jniSetDampingRatio(this.addr, n);
    }
    
    public void setFrequency(final float n) {
        this.jniSetFrequency(this.addr, n);
    }
    
    public void setMaxForce(final float n) {
        this.jniSetMaxForce(this.addr, n);
    }
    
    public void setTarget(final Vector2 vector2) {
        this.jniSetTarget(this.addr, vector2.x, vector2.y);
    }
}
