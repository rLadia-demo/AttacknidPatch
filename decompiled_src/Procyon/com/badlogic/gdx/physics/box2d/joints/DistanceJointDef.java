package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class DistanceJointDef extends JointDef
{
    public float dampingRatio;
    public float frequencyHz;
    public float length;
    public final Vector2 localAnchorA;
    public final Vector2 localAnchorB;
    
    public DistanceJointDef() {
        super();
        this.localAnchorA = new Vector2();
        this.localAnchorB = new Vector2();
        this.length = 1.0f;
        this.frequencyHz = 0.0f;
        this.dampingRatio = 0.0f;
        this.type = JointType.DistanceJoint;
    }
    
    public void initialize(final Body bodyA, final Body bodyB, final Vector2 vector2, final Vector2 vector2) {
        this.bodyA = bodyA;
        this.bodyB = bodyB;
        this.localAnchorA.set(bodyA.getLocalPoint(vector2));
        this.localAnchorB.set(bodyB.getLocalPoint(vector2));
        this.length = vector2.dst(vector2);
    }
}
