package com.badlogic.gdx.math;

public final class Vector2
{
    private static final Vector2 tmp;
    public float x;
    public float y;
    
    static {
        tmp = new Vector2();
    }
    
    public Vector2() {
        super();
    }
    
    public Vector2(final float x, final float y) {
        super();
        this.x = x;
        this.y = y;
    }
    
    public Vector2(final Vector2 vector2) {
        super();
        this.set(vector2);
    }
    
    public Vector2 add(final float n, final float n2) {
        this.x += n;
        this.y += n2;
        return this;
    }
    
    public Vector2 add(final Vector2 vector2) {
        this.x += vector2.x;
        this.y += vector2.y;
        return this;
    }
    
    public Vector2 cpy() {
        return new Vector2(this);
    }
    
    public float cross(final Vector2 vector2) {
        return this.x * vector2.y - vector2.x * this.y;
    }
    
    public float dot(final Vector2 vector2) {
        return this.x * vector2.x + this.y * vector2.y;
    }
    
    public float dst(final float n, final float n2) {
        final float n3 = n - this.x;
        final float n4 = n2 - this.y;
        return (float)Math.sqrt(n3 * n3 + n4 * n4);
    }
    
    public float dst(final Vector2 vector2) {
        final float n = vector2.x - this.x;
        final float n2 = vector2.y - this.y;
        return (float)Math.sqrt(n * n + n2 * n2);
    }
    
    public float dst2(final Vector2 vector2) {
        final float n = vector2.x - this.x;
        final float n2 = vector2.y - this.y;
        return n * n + n2 * n2;
    }
    
    public float len() {
        return (float)Math.sqrt(this.x * this.x + this.y * this.y);
    }
    
    public float len2() {
        return this.x * this.x + this.y * this.y;
    }
    
    public float lenManhattan() {
        return Math.abs(this.x) + Math.abs(this.y);
    }
    
    public Vector2 mul(final float n) {
        this.x *= n;
        this.y *= n;
        return this;
    }
    
    public Vector2 nor() {
        final float len = this.len();
        if (len != 0.0f) {
            this.x /= len;
            this.y /= len;
        }
        return this;
    }
    
    public Vector2 set(final float x, final float y) {
        this.x = x;
        this.y = y;
        return this;
    }
    
    public Vector2 set(final Vector2 vector2) {
        this.x = vector2.x;
        this.y = vector2.y;
        return this;
    }
    
    public Vector2 sub(final float n, final float n2) {
        this.x -= n;
        this.y -= n2;
        return this;
    }
    
    public Vector2 sub(final Vector2 vector2) {
        this.x -= vector2.x;
        this.y -= vector2.y;
        return this;
    }
    
    public Vector2 tmp() {
        return Vector2.tmp.set(this);
    }
    
    @Override
    public String toString() {
        return "[" + this.x + ":" + this.y + "]";
    }
}
