/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class BodyDef {
    public boolean active = true;
    public boolean allowSleep = true;
    public float angle = 0.0f;
    public float angularDamping = 0.0f;
    public float angularVelocity = 0.0f;
    public boolean awake = true;
    public boolean bullet = false;
    public boolean fixedRotation = false;
    public float inertiaScale = 1.0f;
    public float linearDamping = 0.0f;
    public final Vector2 linearVelocity = new Vector2();
    public final Vector2 position = new Vector2();
    public BodyType type = BodyType.StaticBody;

    public static final class BodyType
    extends Enum<BodyType> {
        public static final /* enum */ BodyType DynamicBody;
        private static final /* synthetic */ BodyType[] ENUM$VALUES;
        public static final /* enum */ BodyType KinematicBody;
        public static final /* enum */ BodyType StaticBody;
        private int value;

        static {
            BodyType.StaticBody = new BodyType("StaticBody", 0, 0);
            BodyType.KinematicBody = new BodyType("KinematicBody", 1, 1);
            BodyType.DynamicBody = new BodyType("DynamicBody", 2, 2);
            BodyType[] arrbodyType = new BodyType[]{BodyType.StaticBody, BodyType.KinematicBody, BodyType.DynamicBody};
            BodyType.ENUM$VALUES = arrbodyType;
        }

        private BodyType(String string2, int n22, int n22) {
            super(string, n);
            this.value = string2;
        }

        public static BodyType valueOf(String string) {
            return (BodyType)Enum.valueOf(BodyType.class, string);
        }

        public static BodyType[] values() {
            BodyType[] arrbodyType = BodyType.ENUM$VALUES;
            int n = arrbodyType.length;
            BodyType[] arrbodyType2 = new BodyType[n];
            System.arraycopy(arrbodyType, 0, arrbodyType2, 0, n);
            return arrbodyType2;
        }

        public int getValue() {
            return this.value;
        }
    }

}

