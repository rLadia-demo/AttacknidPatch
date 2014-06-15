/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;

public class DistanceJointDef
extends JointDef {
    public float dampingRatio = 0.0f;
    public float frequencyHz = 0.0f;
    public float length = 1.0f;
    public final Vector2 localAnchorA = new Vector2();
    public final Vector2 localAnchorB = new Vector2();

    public DistanceJointDef() {
        this.type = JointDef.JointType.DistanceJoint;
    }

    public void initialize(Body body, Body body2, Vector2 vector2, Vector2 vector22) {
        this.bodyA = body;
        this.bodyB = body2;
        this.localAnchorA.set(body.getLocalPoint(vector2));
        this.localAnchorB.set(body2.getLocalPoint(vector22));
        this.length = vector2.dst(vector22);
    }
}

