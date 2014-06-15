package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class PolygonShape extends Shape
{
    private static float[] verts;
    
    static {
        PolygonShape.verts = new float[2];
    }
    
    public PolygonShape() {
        super();
        this.addr = this.newPolygonShape();
    }
    
    protected PolygonShape(final long addr) {
        super();
        this.addr = addr;
    }
    
    private native void jniGetVertex(final long p0, final int p1, final float[] p2);
    
    private native int jniGetVertexCount(final long p0);
    
    private native void jniSet(final long p0, final float[] p1);
    
    private native void jniSetAsBox(final long p0, final float p1, final float p2);
    
    private native void jniSetAsBox(final long p0, final float p1, final float p2, final float p3, final float p4, final float p5);
    
    private native void jniSetAsEdge(final long p0, final float p1, final float p2, final float p3, final float p4);
    
    private native long newPolygonShape();
    
    @Override
    public Type getType() {
        return Type.Polygon;
    }
    
    public void getVertex(final int n, final Vector2 vector2) {
        this.jniGetVertex(this.addr, n, PolygonShape.verts);
        vector2.x = PolygonShape.verts[0];
        vector2.y = PolygonShape.verts[1];
    }
    
    public int getVertexCount() {
        return this.jniGetVertexCount(this.addr);
    }
    
    public void set(final Vector2[] array) {
        final float[] array2 = new float[2 * array.length];
        for (int i = 0, n = 0; i < 2 * array.length; i += 2, ++n) {
            array2[i] = array[n].x;
            array2[i + 1] = array[n].y;
        }
        this.jniSet(this.addr, array2);
    }
    
    public void setAsBox(final float n, final float n2) {
        this.jniSetAsBox(this.addr, n, n2);
    }
    
    public void setAsBox(final float n, final float n2, final Vector2 vector2, final float n3) {
        this.jniSetAsBox(this.addr, n, n2, vector2.x, vector2.y, n3);
    }
    
    public void setAsEdge(final Vector2 vector2, final Vector2 vector2) {
        this.jniSetAsEdge(this.addr, vector2.x, vector2.y, vector2.x, vector2.y);
    }
}
