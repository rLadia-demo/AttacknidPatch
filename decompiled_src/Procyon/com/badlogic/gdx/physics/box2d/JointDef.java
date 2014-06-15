package com.badlogic.gdx.physics.box2d;

public class JointDef
{
    public Body bodyA;
    public Body bodyB;
    public boolean collideConnected;
    public JointType type;
    
    public JointDef() {
        super();
        this.type = JointType.Unknown;
        this.bodyA = null;
        this.bodyB = null;
        this.collideConnected = false;
    }
    
    public enum JointType
    {
        DistanceJoint("DistanceJoint", 3, 3), 
        FrictionJoint("FrictionJoint", 9, 9), 
        GearJoint("GearJoint", 6, 6), 
        LineJoint("LineJoint", 7, 7), 
        MouseJoint("MouseJoint", 5, 5), 
        PrismaticJoint("PrismaticJoint", 2, 2), 
        PulleyJoint("PulleyJoint", 4, 4), 
        RevoluteJoint("RevoluteJoint", 1, 1), 
        Unknown("Unknown", 0, 0), 
        WeldJoint("WeldJoint", 8, 8);
        
        private int value;
        
        private JointType(final String s, final int n, final int value) {
            this.value = value;
        }
        
        public int getValue() {
            return this.value;
        }
    }
}
