package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;
import com.badlogic.gdx.math.*;

public class MouseJointDef extends JointDef
{
    public float dampingRatio;
    public float frequencyHz;
    public float maxForce;
    public final Vector2 target;
    
    public MouseJointDef() {
        super();
        this.target = new Vector2();
        this.maxForce = 0.0f;
        this.frequencyHz = 5.0f;
        this.dampingRatio = 0.7f;
        this.type = JointType.MouseJoint;
    }
}
