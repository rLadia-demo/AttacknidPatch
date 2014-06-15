/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;
import com.badlogic.gdx.physics.box2d.JointEdge;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.utils.LongHashMap;

public abstract class Joint {
    protected long addr;
    private final Vector2 anchorA = new Vector2();
    private final Vector2 anchorB = new Vector2();
    protected JointEdge jointEdgeA;
    protected JointEdge jointEdgeB;
    private final Vector2 reactionForce = new Vector2();
    private final float[] tmp = new float[2];
    private final World world;

    protected Joint(World world, long l) {
        this.world = world;
        this.addr = l;
    }

    private native void jniGetAnchorA(long var1, float[] var3);

    private native void jniGetAnchorB(long var1, float[] var3);

    private native long jniGetBodyA(long var1);

    private native long jniGetBodyB(long var1);

    private native void jniGetReactionForce(long var1, float var3, float[] var4);

    private native float jniGetReactionTorque(long var1, float var3);

    private native int jniGetType(long var1);

    private native boolean jniIsActive(long var1);

    public Vector2 getAnchorA() {
        this.jniGetAnchorA(this.addr, this.tmp);
        this.anchorA.x = this.tmp[0];
        this.anchorA.y = this.tmp[1];
        return this.anchorA;
    }

    public Vector2 getAnchorB() {
        this.jniGetAnchorB(this.addr, this.tmp);
        this.anchorB.x = this.tmp[0];
        this.anchorB.y = this.tmp[1];
        return this.anchorB;
    }

    public Body getBodyA() {
        return this.world.bodies.get(this.jniGetBodyA(this.addr));
    }

    public Body getBodyB() {
        return this.world.bodies.get(this.jniGetBodyB(this.addr));
    }

    public Vector2 getReactionForce(float f) {
        this.jniGetReactionForce(this.addr, f, this.tmp);
        this.reactionForce.x = this.tmp[0];
        this.reactionForce.y = this.tmp[1];
        return this.reactionForce;
    }

    public float getReactionTorque(float f) {
        return this.jniGetReactionTorque(this.addr, f);
    }

    public ef$JointType getType() {
        int n = this.jniGetType(this.addr);
        int n2 = 0;
        while (n2 < ef$JointType.values().length) {
            if (ef$JointType.values()[n2].getValue() == n) {
                return ef$JointType.values()[n2];
            }
            ++n2;
        }
        return ef$JointType.Unknown;
    }

    public boolean isActive() {
        return this.jniIsActive(this.addr);
    }
}

