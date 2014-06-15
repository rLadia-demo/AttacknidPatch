package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public abstract class Joint
{
    protected long addr;
    private final Vector2 anchorA;
    private final Vector2 anchorB;
    protected JointEdge jointEdgeA;
    protected JointEdge jointEdgeB;
    private final Vector2 reactionForce;
    private final float[] tmp;
    private final World world;
    
    protected Joint(final World world, final long addr) {
        super();
        this.tmp = new float[2];
        this.anchorA = new Vector2();
        this.anchorB = new Vector2();
        this.reactionForce = new Vector2();
        this.world = world;
        this.addr = addr;
    }
    
    private native void jniGetAnchorA(final long p0, final float[] p1);
    
    private native void jniGetAnchorB(final long p0, final float[] p1);
    
    private native long jniGetBodyA(final long p0);
    
    private native long jniGetBodyB(final long p0);
    
    private native void jniGetReactionForce(final long p0, final float p1, final float[] p2);
    
    private native float jniGetReactionTorque(final long p0, final float p1);
    
    private native int jniGetType(final long p0);
    
    private native boolean jniIsActive(final long p0);
    
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
    
    public Vector2 getReactionForce(final float n) {
        this.jniGetReactionForce(this.addr, n, this.tmp);
        this.reactionForce.x = this.tmp[0];
        this.reactionForce.y = this.tmp[1];
        return this.reactionForce;
    }
    
    public float getReactionTorque(final float n) {
        return this.jniGetReactionTorque(this.addr, n);
    }
    
    public JointDef.JointType getType() {
        final int jniGetType = this.jniGetType(this.addr);
        for (int i = 0; i < JointDef.JointType.values().length; ++i) {
            if (JointDef.JointType.values()[i].getValue() == jniGetType) {
                return JointDef.JointType.values()[i];
            }
        }
        return JointDef.JointType.Unknown;
    }
    
    public boolean isActive() {
        return this.jniIsActive(this.addr);
    }
}
