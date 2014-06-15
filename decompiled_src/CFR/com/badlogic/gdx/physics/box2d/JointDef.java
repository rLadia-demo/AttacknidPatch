/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.physics.box2d.Body;

public class JointDef {
    public Body bodyA = null;
    public Body bodyB = null;
    public boolean collideConnected = false;
    public JointType type = JointType.Unknown;

    public static final class JointType
    extends Enum<JointType> {
        public static final /* enum */ JointType DistanceJoint;
        private static final /* synthetic */ JointType[] ENUM$VALUES;
        public static final /* enum */ JointType FrictionJoint;
        public static final /* enum */ JointType GearJoint;
        public static final /* enum */ JointType LineJoint;
        public static final /* enum */ JointType MouseJoint;
        public static final /* enum */ JointType PrismaticJoint;
        public static final /* enum */ JointType PulleyJoint;
        public static final /* enum */ JointType RevoluteJoint;
        public static final /* enum */ JointType Unknown;
        public static final /* enum */ JointType WeldJoint;
        private int value;

        static {
            JointType.Unknown = new JointType("Unknown", 0, 0);
            JointType.RevoluteJoint = new JointType("RevoluteJoint", 1, 1);
            JointType.PrismaticJoint = new JointType("PrismaticJoint", 2, 2);
            JointType.DistanceJoint = new JointType("DistanceJoint", 3, 3);
            JointType.PulleyJoint = new JointType("PulleyJoint", 4, 4);
            JointType.MouseJoint = new JointType("MouseJoint", 5, 5);
            JointType.GearJoint = new JointType("GearJoint", 6, 6);
            JointType.LineJoint = new JointType("LineJoint", 7, 7);
            JointType.WeldJoint = new JointType("WeldJoint", 8, 8);
            JointType.FrictionJoint = new JointType("FrictionJoint", 9, 9);
            JointType[] arrjointType = new JointType[]{JointType.Unknown, JointType.RevoluteJoint, JointType.PrismaticJoint, JointType.DistanceJoint, JointType.PulleyJoint, JointType.MouseJoint, JointType.GearJoint, JointType.LineJoint, JointType.WeldJoint, JointType.FrictionJoint};
            JointType.ENUM$VALUES = arrjointType;
        }

        private JointType(String string2, int n22, int n22) {
            super(string, n);
            this.value = string2;
        }

        public static JointType valueOf(String string) {
            return (JointType)Enum.valueOf(JointType.class, string);
        }

        public static JointType[] values() {
            JointType[] arrjointType = JointType.ENUM$VALUES;
            int n = arrjointType.length;
            JointType[] arrjointType2 = new JointType[n];
            System.arraycopy(arrjointType, 0, arrjointType2, 0, n);
            return arrjointType2;
        }

        public int getValue() {
            return this.value;
        }
    }

}

