package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;

public class FrictionJoint extends Joint
{
    public FrictionJoint(final World world, final long n) {
        super(world, n);
    }
    
    private native float jniGetMaxForce(final long p0);
    
    private native float jniGetMaxTorque(final long p0);
    
    private native void jniSetMaxForce(final long p0, final float p1);
    
    private native void jniSetMaxTorque(final long p0, final float p1);
    
    public float getMaxForce() {
        return this.jniGetMaxForce(this.addr);
    }
    
    public float getMaxTorque() {
        return this.jniGetMaxTorque(this.addr);
    }
    
    public void setMaxForce(final float n) {
        this.jniSetMaxForce(this.addr, n);
    }
    
    public void setMaxTorque(final float n) {
        this.jniSetMaxTorque(this.addr, n);
    }
}
