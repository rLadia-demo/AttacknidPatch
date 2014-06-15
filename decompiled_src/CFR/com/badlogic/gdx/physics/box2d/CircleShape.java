/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Shape;

public class CircleShape
extends Shape {
    private final Vector2 position = new Vector2();
    private final float[] tmp = new float[2];

    public CircleShape() {
        this.addr = this.newCircleShape();
    }

    protected CircleShape(long l) {
        this.addr = l;
    }

    private native void jniGetPosition(long var1, float[] var3);

    private native void jniSetPosition(long var1, float var3, float var4);

    private native long newCircleShape();

    public Vector2 getPosition() {
        this.jniGetPosition(this.addr, this.tmp);
        this.position.x = this.tmp[0];
        this.position.y = this.tmp[1];
        return this.position;
    }

    @Override
    public Shape.Type getType() {
        return Shape.Type.Circle;
    }

    public void setPosition(Vector2 vector2) {
        this.jniSetPosition(this.addr, vector2.x, vector2.y);
    }
}

