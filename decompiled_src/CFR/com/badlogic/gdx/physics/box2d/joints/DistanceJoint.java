/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class DistanceJoint
extends Joint {
    public DistanceJoint(World world, long l) {
        super(world, l);
    }

    private native float jniGetDampingRatio(long var1);

    private native float jniGetFrequency(long var1);

    private native float jniGetLength(long var1);

    private native void jniSetDampingRatio(long var1, float var3);

    private native void jniSetFrequency(long var1, float var3);

    private native void jniSetLength(long var1, float var3);

    public float getDampingRatio() {
        return this.jniGetDampingRatio(this.addr);
    }

    public float getFrequency() {
        return this.jniGetFrequency(this.addr);
    }

    public float getLength() {
        return this.jniGetLength(this.addr);
    }

    public void setDampingRatio(float f) {
        this.jniSetDampingRatio(this.addr, f);
    }

    public void setFrequency(float f) {
        this.jniSetFrequency(this.addr, f);
    }

    public void setLength(float f) {
        this.jniSetLength(this.addr, f);
    }
}

