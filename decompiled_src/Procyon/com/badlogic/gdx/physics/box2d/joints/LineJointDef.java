package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class LineJointDef extends JointDef
{
    public boolean enableLimit;
    public boolean enableMotor;
    public final Vector2 localAnchorA;
    public final Vector2 localAnchorB;
    public final Vector2 localAxisA;
    public float lowerTranslation;
    public float maxMotorForce;
    public float motorSpeed;
    public float upperTranslation;
    
    public LineJointDef() {
        super();
        this.localAnchorA = new Vector2();
        this.localAnchorB = new Vector2();
        this.localAxisA = new Vector2(1.0f, 0.0f);
        this.enableLimit = false;
        this.lowerTranslation = 0.0f;
        this.upperTranslation = 0.0f;
        this.enableMotor = false;
        this.maxMotorForce = 0.0f;
        this.motorSpeed = 0.0f;
        this.type = JointType.LineJoint;
    }
    
    public void initialize(final Body bodyA, final Body bodyB, final Vector2 vector2, final Vector2 vector2) {
        this.bodyA = bodyA;
        this.bodyB = bodyB;
        this.localAnchorA.set(bodyA.getLocalPoint(vector2));
        this.localAnchorB.set(bodyB.getLocalPoint(vector2));
        this.localAxisA.set(bodyA.getLocalVector(vector2));
    }
}
