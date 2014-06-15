/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class FrictionJoint
extends Joint {
    public FrictionJoint(World world, long l) {
        super(world, l);
    }

    private native float jniGetMaxForce(long var1);

    private native float jniGetMaxTorque(long var1);

    private native void jniSetMaxForce(long var1, float var3);

    private native void jniSetMaxTorque(long var1, float var3);

    public float getMaxForce() {
        return this.jniGetMaxForce(this.addr);
    }

    public float getMaxTorque() {
        return this.jniGetMaxTorque(this.addr);
    }

    public void setMaxForce(float f) {
        this.jniSetMaxForce(this.addr, f);
    }

    public void setMaxTorque(float f) {
        this.jniSetMaxTorque(this.addr, f);
    }
}

