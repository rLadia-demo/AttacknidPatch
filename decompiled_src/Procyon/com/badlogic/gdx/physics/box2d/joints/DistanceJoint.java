package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;

public class DistanceJoint extends Joint
{
    public DistanceJoint(final World world, final long n) {
        super(world, n);
    }
    
    private native float jniGetDampingRatio(final long p0);
    
    private native float jniGetFrequency(final long p0);
    
    private native float jniGetLength(final long p0);
    
    private native void jniSetDampingRatio(final long p0, final float p1);
    
    private native void jniSetFrequency(final long p0, final float p1);
    
    private native void jniSetLength(final long p0, final float p1);
    
    public float getDampingRatio() {
        return this.jniGetDampingRatio(this.addr);
    }
    
    public float getFrequency() {
        return this.jniGetFrequency(this.addr);
    }
    
    public float getLength() {
        return this.jniGetLength(this.addr);
    }
    
    public void setDampingRatio(final float n) {
        this.jniSetDampingRatio(this.addr, n);
    }
    
    public void setFrequency(final float n) {
        this.jniSetFrequency(this.addr, n);
    }
    
    public void setLength(final float n) {
        this.jniSetLength(this.addr, n);
    }
}
