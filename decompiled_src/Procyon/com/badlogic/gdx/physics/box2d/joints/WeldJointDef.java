package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class WeldJointDef extends JointDef
{
    public final Vector2 localAnchorA;
    public final Vector2 localAnchorB;
    public float referenceAngle;
    
    public WeldJointDef() {
        super();
        this.localAnchorA = new Vector2();
        this.localAnchorB = new Vector2();
        this.referenceAngle = 0.0f;
        this.type = JointType.WeldJoint;
    }
    
    public void initialize(final Body bodyA, final Body bodyB, final Vector2 vector2) {
        this.bodyA = bodyA;
        this.bodyB = bodyB;
        this.localAnchorA.set(bodyA.getLocalPoint(vector2));
        this.localAnchorB.set(bodyB.getLocalPoint(vector2));
        this.referenceAngle = bodyB.getAngle() - bodyA.getAngle();
    }
}
