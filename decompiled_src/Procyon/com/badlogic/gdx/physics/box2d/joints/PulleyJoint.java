package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class PulleyJoint extends Joint
{
    private final Vector2 groundAnchorA;
    private final Vector2 groundAnchorB;
    private final float[] tmp;
    
    public PulleyJoint(final World world, final long n) {
        super(world, n);
        this.tmp = new float[2];
        this.groundAnchorA = new Vector2();
        this.groundAnchorB = new Vector2();
    }
    
    private native void jniGetGroundAnchorA(final long p0, final float[] p1);
    
    private native void jniGetGroundAnchorB(final long p0, final float[] p1);
    
    private native float jniGetLength1(final long p0);
    
    private native float jniGetLength2(final long p0);
    
    private native float jniGetRatio(final long p0);
    
    public Vector2 getGroundAnchorA() {
        this.jniGetGroundAnchorA(this.addr, this.tmp);
        this.groundAnchorA.set(this.tmp[0], this.tmp[1]);
        return this.groundAnchorA;
    }
    
    public Vector2 getGroundAnchorB() {
        this.jniGetGroundAnchorB(this.addr, this.tmp);
        this.groundAnchorB.set(this.tmp[0], this.tmp[1]);
        return this.groundAnchorB;
    }
    
    public float getLength1() {
        return this.jniGetLength1(this.addr);
    }
    
    public float getLength2() {
        return this.jniGetLength2(this.addr);
    }
    
    public float getRatio() {
        return this.jniGetRatio(this.addr);
    }
}
