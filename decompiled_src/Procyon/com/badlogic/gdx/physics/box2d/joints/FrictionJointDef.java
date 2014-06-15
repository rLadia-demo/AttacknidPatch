package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class FrictionJointDef extends JointDef
{
    public final Vector2 localAnchorA;
    public final Vector2 localAnchorB;
    public float maxForce;
    public float maxTorque;
    
    public FrictionJointDef() {
        super();
        this.localAnchorA = new Vector2();
        this.localAnchorB = new Vector2();
        this.maxForce = 0.0f;
        this.maxTorque = 0.0f;
        this.type = JointType.FrictionJoint;
    }
    
    public void initialize(final Body bodyA, final Body bodyB, final Vector2 vector2) {
        this.bodyA = bodyA;
        this.bodyB = bodyB;
        this.localAnchorA.set(bodyA.getLocalPoint(vector2));
        this.localAnchorB.set(bodyB.getLocalPoint(vector2));
    }
}
