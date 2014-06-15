package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.*;

public class BodyDef
{
    public boolean active;
    public boolean allowSleep;
    public float angle;
    public float angularDamping;
    public float angularVelocity;
    public boolean awake;
    public boolean bullet;
    public boolean fixedRotation;
    public float inertiaScale;
    public float linearDamping;
    public final Vector2 linearVelocity;
    public final Vector2 position;
    public BodyType type;
    
    public BodyDef() {
        super();
        this.type = BodyType.StaticBody;
        this.position = new Vector2();
        this.angle = 0.0f;
        this.linearVelocity = new Vector2();
        this.angularVelocity = 0.0f;
        this.linearDamping = 0.0f;
        this.angularDamping = 0.0f;
        this.allowSleep = true;
        this.awake = true;
        this.fixedRotation = false;
        this.bullet = false;
        this.active = true;
        this.inertiaScale = 1.0f;
    }
    
    public enum BodyType
    {
        DynamicBody("DynamicBody", 2, 2), 
        KinematicBody("KinematicBody", 1, 1), 
        StaticBody("StaticBody", 0, 0);
        
        private int value;
        
        private BodyType(final String s, final int n, final int value) {
            this.value = value;
        }
        
        public int getValue() {
            return this.value;
        }
    }
}
