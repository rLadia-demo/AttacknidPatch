package com.badlogic.gdx.physics.box2d;

public class JointEdge
{
    public final Joint joint;
    public final Body other;
    
    protected JointEdge(final Body other, final Joint joint) {
        super();
        this.other = other;
        this.joint = joint;
    }
}
