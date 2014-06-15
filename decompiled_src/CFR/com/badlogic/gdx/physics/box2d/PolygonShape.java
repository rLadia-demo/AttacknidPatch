/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Shape;

public class PolygonShape
extends Shape {
    private static float[] verts = new float[2];

    public PolygonShape() {
        this.addr = this.newPolygonShape();
    }

    protected PolygonShape(long l) {
        this.addr = l;
    }

    private native void jniGetVertex(long var1, int var3, float[] var4);

    private native int jniGetVertexCount(long var1);

    private native void jniSet(long var1, float[] var3);

    private native void jniSetAsBox(long var1, float var3, float var4);

    private native void jniSetAsBox(long var1, float var3, float var4, float var5, float var6, float var7);

    private native void jniSetAsEdge(long var1, float var3, float var4, float var5, float var6);

    private native long newPolygonShape();

    @Override
    public Shape.Type getType() {
        return Shape.Type.Polygon;
    }

    public void getVertex(int n, Vector2 vector2) {
        this.jniGetVertex(this.addr, n, PolygonShape.verts);
        vector2.x = PolygonShape.verts[0];
        vector2.y = PolygonShape.verts[1];
    }

    public int getVertexCount() {
        return this.jniGetVertexCount(this.addr);
    }

    public void set(Vector2[] arrvector2) {
        float[] arrf = new float[2 * arrvector2.length];
        int n = 0;
        int n2 = 0;
        do {
            if (n >= 2 * arrvector2.length) {
                this.jniSet(this.addr, arrf);
                return;
            }
            arrf[n] = arrvector2[n2].x;
            arrf[n + 1] = arrvector2[n2].y;
            n+=2;
            ++n2;
        } while (true);
    }

    public void setAsBox(float f, float f2) {
        this.jniSetAsBox(this.addr, f, f2);
    }

    public void setAsBox(float f, float f2, Vector2 vector2, float f3) {
        this.jniSetAsBox(this.addr, f, f2, vector2.x, vector2.y, f3);
    }

    public void setAsEdge(Vector2 vector2, Vector2 vector22) {
        this.jniSetAsEdge(this.addr, vector2.x, vector2.y, vector22.x, vector22.y);
    }
}

