package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class CircleShape extends Shape
{
    private final Vector2 position;
    private final float[] tmp;
    
    public CircleShape() {
        super();
        this.tmp = new float[2];
        this.position = new Vector2();
        this.addr = this.newCircleShape();
    }
    
    protected CircleShape(final long addr) {
        super();
        this.tmp = new float[2];
        this.position = new Vector2();
        this.addr = addr;
    }
    
    private native void jniGetPosition(final long p0, final float[] p1);
    
    private native void jniSetPosition(final long p0, final float p1, final float p2);
    
    private native long newCircleShape();
    
    public Vector2 getPosition() {
        this.jniGetPosition(this.addr, this.tmp);
        this.position.x = this.tmp[0];
        this.position.y = this.tmp[1];
        return this.position;
    }
    
    @Override
    public Type getType() {
        return Type.Circle;
    }
    
    public void setPosition(final Vector2 vector2) {
        this.jniSetPosition(this.addr, vector2.x, vector2.y);
    }
}
