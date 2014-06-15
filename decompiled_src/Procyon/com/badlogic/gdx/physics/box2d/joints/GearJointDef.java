package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.*;

public class GearJointDef extends JointDef
{
    public Joint joint1;
    public Joint joint2;
    public float ratio;
    
    public GearJointDef() {
        super();
        this.joint1 = null;
        this.joint2 = null;
        this.ratio = 1.0f;
        this.type = JointType.GearJoint;
    }
}
