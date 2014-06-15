package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;

public class GearJoint extends Joint
{
    public GearJoint(final World world, final long n) {
        super(world, n);
    }
    
    private native float jniGetRatio(final long p0);
    
    private native void jniSetRatio(final long p0, final float p1);
    
    public float getRatio() {
        return this.jniGetRatio(this.addr);
    }
    
    public void setRatio(final float n) {
        this.jniSetRatio(this.addr, n);
    }
}
