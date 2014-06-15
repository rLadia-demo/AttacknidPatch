/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.CircleShape;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.Shape;
import com.badlogic.gdx.physics.box2d.World;

public class Fixture {
    protected final long addr;
    private final Body body;
    private final Filter filter = new Filter();
    protected Shape shape;
    private final short[] tmp = new short[3];
    private final World world;

    protected Fixture(World world, Body body, long l) {
        this.world = world;
        this.body = body;
        this.addr = l;
    }

    private native float jniGetDensity(long var1);

    private native void jniGetFilterData(long var1, short[] var3);

    private native float jniGetFriction(long var1);

    private native float jniGetRestitution(long var1);

    private native long jniGetShape(long var1);

    private native int jniGetType(long var1);

    private native boolean jniIsSensor(long var1);

    private native void jniSetDensity(long var1, float var3);

    private native void jniSetFilterData(long var1, short var3, short var4, short var5);

    private native void jniSetFriction(long var1, float var3);

    private native void jniSetRestitution(long var1, float var3);

    private native void jniSetSensor(long var1, boolean var3);

    private native boolean jniTestPoint(long var1, float var3, float var4);

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

    /*
     * Enabled aggressive block sorting
     */
    public Shape getShape() {
        if (this.shape != null) return this.shape;
        long l = this.jniGetShape(this.addr);
        this.shape = Shape.jniGetType(l) == 0 ? new CircleShape(l) : new PolygonShape(l);
        return this.shape;
    }

    public Shape.Type getType() {
        if (this.jniGetType(this.addr) != 0) return Shape.Type.Polygon;
        return Shape.Type.Circle;
    }

    public boolean isSensor() {
        return this.jniIsSensor(this.addr);
    }

    public void setDensity(float f) {
        this.jniSetDensity(this.addr, f);
    }

    public void setFilterData(Filter filter) {
        this.jniSetFilterData(this.addr, filter.categoryBits, filter.maskBits, filter.groupIndex);
    }

    public void setFriction(float f) {
        this.jniSetFriction(this.addr, f);
    }

    public void setRestitution(float f) {
        this.jniSetRestitution(this.addr, f);
    }

    public void setSensor(boolean bl) {
        this.jniSetSensor(this.addr, bl);
    }

    public boolean testPoint(Vector2 vector2) {
        return this.jniTestPoint(this.addr, vector2.x, vector2.y);
    }
}

