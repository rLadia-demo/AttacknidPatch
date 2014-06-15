package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class MassData
{
    public float I;
    public final Vector2 center;
    public float mass;
    
    public MassData() {
        super();
        this.center = new Vector2();
    }
}
