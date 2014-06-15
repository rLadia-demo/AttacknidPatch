package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class Fixture
{
    protected final long addr;
    private final Body body;
    private final Filter filter;
    protected Shape shape;
    private final short[] tmp;
    private final World world;
    
    protected Fixture(final World world, final Body body, final long addr) {
        super();
        this.tmp = new short[3];
        this.filter = new Filter();
        this.world = world;
        this.body = body;
        this.addr = addr;
    }
    
    private native float jniGetDensity(final long p0);
    
    private native void jniGetFilterData(final long p0, final short[] p1);
    
    private native float jniGetFriction(final long p0);
    
    private native float jniGetRestitution(final long p0);
    
    private native long jniGetShape(final long p0);
    
    private native int jniGetType(final long p0);
    
    private native boolean jniIsSensor(final long p0);
    
    private native void jniSetDensity(final long p0, final float p1);
    
    private native void jniSetFilterData(final long p0, final short p1, final short p2, final short p3);
    
    private native void jniSetFriction(final long p0, final float p1);
    
    private native void jniSetRestitution(final long p0, final float p1);
    
    private native void jniSetSensor(final long p0, final boolean p1);
    
    private native boolean jniTestPoint(final long p0, final float p1, final float p2);
    
    public Body getBody() {
        return this.body;
    }
    
    public float getDensity() {
        return this.jniGetDensity(this.addr);
    }
    
    public Filter getFilterData() {
        this.jniGetFilterData(this.addr, this.tmp);
        this.filter.categoryBits = this.tmp[0];
        this.filter.maskBits = this.tmp[1];
        this.filter.groupIndex = this.tmp[2];
        return this.filter;
    }
    
    public float getFriction() {
        return this.jniGetFriction(this.addr);
    }
    
    public float getRestitution() {
        return this.jniGetRestitution(this.addr);
    }
    
    public Shape getShape() {
        if (this.shape == null) {
            final long jniGetShape = this.jniGetShape(this.addr);
            if (Shape.jniGetType(jniGetShape) == 0) {
                this.shape = new CircleShape(jniGetShape);
            }
            else {
                this.shape = new PolygonShape(jniGetShape);
            }
        }
        return this.shape;
    }
    
    public Shape.Type getType() {
        if (this.jniGetType(this.addr) == 0) {
            return Shape.Type.Circle;
        }
        return Shape.Type.Polygon;
    }
    
    public boolean isSensor() {
        return this.jniIsSensor(this.addr);
    }
    
    public void setDensity(final float n) {
        this.jniSetDensity(this.addr, n);
    }
    
    public void setFilterData(final Filter filter) {
        this.jniSetFilterData(this.addr, filter.categoryBits, filter.maskBits, filter.groupIndex);
    }
    
    public void setFriction(final float n) {
        this.jniSetFriction(this.addr, n);
    }
    
    public void setRestitution(final float n) {
        this.jniSetRestitution(this.addr, n);
    }
    
    public void setSensor(final boolean b) {
        this.jniSetSensor(this.addr, b);
    }
    
    public boolean testPoint(final Vector2 vector2) {
        return this.jniTestPoint(this.addr, vector2.x, vector2.y);
    }
}
