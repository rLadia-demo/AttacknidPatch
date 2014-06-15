/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class GearJoint
extends Joint {
    public GearJoint(World world, long l) {
        super(world, l);
    }

    private native float jniGetRatio(long var1);

    private native void jniSetRatio(long var1, float var3);

    public float getRatio() {
        return this.jniGetRatio(this.addr);
    }

    public void setRatio(float f) {
        this.jniSetRatio(this.addr, f);
    }
}

