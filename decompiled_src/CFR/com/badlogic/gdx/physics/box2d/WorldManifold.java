/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class WorldManifold {
    protected final Vector2 normal = new Vector2();
    protected int numContactPoints;
    protected final Vector2[] points;

    protected WorldManifold() {
        Vector2[] arrvector2 = new Vector2[]{new Vector2(), new Vector2()};
        this.points = arrvector2;
    }

    public Vector2 getNormal() {
        return this.normal;
    }

    public int getNumberOfContactPoints() {
        return this.numContactPoints;
    }

    public Vector2[] getPoints() {
        return this.points;
    }
}

