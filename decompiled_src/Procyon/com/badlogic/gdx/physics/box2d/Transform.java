package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class Transform
{
    public static final int COL1_X = 2;
    public static final int COL1_Y = 3;
    public static final int COL2_X = 4;
    public static final int COL2_Y = 5;
    public static final int POS_X = 0;
    public static final int POS_Y = 1;
    private Vector2 position;
    public float[] vals;
    
    public Transform() {
        super();
        this.vals = new float[6];
        this.position = new Vector2();
    }
    
    public Transform(final Vector2 position, final float rotation) {
        super();
        this.vals = new float[6];
        this.position = new Vector2();
        this.setPosition(position);
        this.setRotation(rotation);
    }
    
    public Vector2 getPosition() {
        return this.position.set(this.vals[0], this.vals[1]);
    }
    
    public Vector2 mul(final Vector2 vector2) {
        final float x = this.vals[0] + this.vals[2] * vector2.x + this.vals[4] * vector2.y;
        final float y = this.vals[1] + this.vals[3] * vector2.x + this.vals[5] * vector2.y;
        vector2.x = x;
        vector2.y = y;
        return vector2;
    }
    
    public void setPosition(final Vector2 vector2) {
        this.vals[0] = vector2.x;
        this.vals[1] = vector2.y;
    }
    
    public void setRotation(final float n) {
        final float n2 = (float)Math.cos(n);
        final float n3 = (float)Math.sin(n);
        this.vals[2] = n2;
        this.vals[4] = -n3;
        this.vals[3] = n3;
        this.vals[5] = n2;
    }
}
