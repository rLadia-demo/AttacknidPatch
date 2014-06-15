package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class WorldManifold
{
    protected final Vector2 normal;
    protected int numContactPoints;
    protected final Vector2[] points;
    
    protected WorldManifold() {
        super();
        this.normal = new Vector2();
        this.points = new Vector2[] { new Vector2(), new Vector2() };
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
