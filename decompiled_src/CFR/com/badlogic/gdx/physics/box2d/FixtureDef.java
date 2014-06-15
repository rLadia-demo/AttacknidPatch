/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.Shape;

public class FixtureDef {
    public float density = 0.0f;
    public final Filter filter = new Filter();
    public float friction = 0.2f;
    public boolean isSensor = false;
    public float restitution = 0.0f;
    public Shape shape;
}

