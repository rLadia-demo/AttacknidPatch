/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;

public class PrismaticJointDef
extends JointDef {
    public boolean enableLimit = false;
    public boolean enableMotor = false;
    public final Vector2 localAnchorA = new Vector2();
    public final Vector2 localAnchorB = new Vector2();
    public final Vector2 localAxis1 = new Vector2(1.0f, 0.0f);
    public float lowerTranslation = 0.0f;
    public float maxMotorForce = 0.0f;
    public float motorSpeed = 0.0f;
    public float referenceAngle = 0.0f;
    public float upperTranslation = 0.0f;

    public PrismaticJointDef() {
        this.type = JointDef.JointType.PrismaticJoint;
    }

    public void initialize(Body body, Body body2, Vector2 vector2, Vector2 vector22) {
        this.bodyA = body;
        this.bodyB = body2;
        this.localAnchorA.set(body.getLocalPoint(vector2));
        this.localAnchorB.set(body2.getLocalPoint(vector2));
        this.localAxis1.set(body.getLocalVector(vector22));
        this.referenceAngle = body2.getAngle() - body.getAngle();
    }
}

