package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.*;

public class PulleyJointDef extends JointDef
{
    private static final float minPulleyLength = 2.0f;
    public final Vector2 groundAnchorA;
    public final Vector2 groundAnchorB;
    public float lengthA;
    public float lengthB;
    public final Vector2 localAnchorA;
    public final Vector2 localAnchorB;
    public float maxLengthA;
    public float maxLengthB;
    public float ratio;
    
    public PulleyJointDef() {
        super();
        this.groundAnchorA = new Vector2(-1.0f, 1.0f);
        this.groundAnchorB = new Vector2(1.0f, 1.0f);
        this.localAnchorA = new Vector2(-1.0f, 0.0f);
        this.localAnchorB = new Vector2(1.0f, 0.0f);
        this.lengthA = 0.0f;
        this.maxLengthA = 0.0f;
        this.lengthB = 0.0f;
        this.maxLengthB = 0.0f;
        this.ratio = 1.0f;
        this.type = JointType.PulleyJoint;
        this.collideConnected = true;
    }
    
    public void initialize(final Body bodyA, final Body bodyB, final Vector2 vector2, final Vector2 vector2, final Vector2 vector3, final Vector2 vector4, final float ratio) {
        this.bodyA = bodyA;
        this.bodyB = bodyB;
        this.groundAnchorA.set(vector2);
        this.groundAnchorB.set(vector2);
        this.localAnchorA.set(bodyA.getLocalPoint(vector3));
        this.localAnchorB.set(bodyB.getLocalPoint(vector4));
        this.lengthA = vector3.dst(vector2);
        this.lengthB = vector4.dst(vector2);
        this.ratio = ratio;
        final float n = this.lengthA + ratio * this.lengthB;
        this.maxLengthA = n - ratio * 2.0f;
        this.maxLengthB = (n - 2.0f) / ratio;
    }
}
