package com.badlogic.gdx.physics.box2d;

public class FixtureDef
{
    public float density;
    public final Filter filter;
    public float friction;
    public boolean isSensor;
    public float restitution;
    public Shape shape;
    
    public FixtureDef() {
        super();
        this.friction = 0.2f;
        this.restitution = 0.0f;
        this.density = 0.0f;
        this.isSensor = false;
        this.filter = new Filter();
    }
}
