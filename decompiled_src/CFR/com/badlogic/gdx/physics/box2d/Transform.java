/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Transform {
    public static final int COL1_X = 2;
    public static final int COL1_Y = 3;
    public static final int COL2_X = 4;
    public static final int COL2_Y = 5;
    public static final int POS_X = 0;
    public static final int POS_Y = 1;
    private Vector2 position = new Vector2();
    public float[] vals = new float[6];

    public Transform() {
    }

    public Transform(Vector2 vector2, float f) {
        this.setPosition(vector2);
        this.setRotation(f);
    }

    public Vector2 getPosition() {
        return this.position.set(this.vals[0], this.vals[1]);
    }

    public Vector2 mul(Vector2 vector2) {
        float f = this.vals[0] + this.vals[2] * vector2.x + this.vals[4] * vector2.y;
        float f2 = this.vals[1] + this.vals[3] * vector2.x + this.vals[5] * vector2.y;
        vector2.x = f;
        vector2.y = f2;
        return vector2;
    }

    public void setPosition(Vector2 vector2) {
        this.vals[0] = vector2.x;
        this.vals[1] = vector2.y;
    }

    public void setRotation(float f) {
        float f2 = (float)Math.cos(f);
        float f3 = (float)Math.sin(f);
        this.vals[2] = f2;
        this.vals[4] = - f3;
        this.vals[3] = f3;
        this.vals[5] = f2;
    }
}

