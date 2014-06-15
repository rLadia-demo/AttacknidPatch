/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.math;

public final class Vector2 {
    private static final Vector2 tmp = new Vector2();
    public float x;
    public float y;

    public Vector2() {
    }

    public Vector2(float f, float f2) {
        this.x = f;
        this.y = f2;
    }

    public Vector2(Vector2 vector2) {
        this.set(vector2);
    }

    public Vector2 add(float f, float f2) {
        this.x = f + this.x;
        this.y = f2 + this.y;
        return this;
    }

    public Vector2 add(Vector2 vector2) {
        this.x+=vector2.x;
        this.y+=vector2.y;
        return this;
    }

    public Vector2 cpy() {
        return new Vector2(this);
    }

    public float cross(Vector2 vector2) {
        return this.x * vector2.y - vector2.x * this.y;
    }

    public float dot(Vector2 vector2) {
        return this.x * vector2.x + this.y * vector2.y;
    }

    public float dst(float f, float f2) {
        float f3 = f - this.x;
        float f4 = f2 - this.y;
        return (float)Math.sqrt(f3 * f3 + f4 * f4);
    }

    public float dst(Vector2 vector2) {
        float f = vector2.x - this.x;
        float f2 = vector2.y - this.y;
        return (float)Math.sqrt(f * f + f2 * f2);
    }

    public float dst2(Vector2 vector2) {
        float f = vector2.x - this.x;
        float f2 = vector2.y - this.y;
        return f * f + f2 * f2;
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

    public Vector2 mul(float f) {
        this.x = f * this.x;
        this.y = f * this.y;
        return this;
    }

    public Vector2 nor() {
        float f = this.len();
        if (f == 0.0f) return this;
        this.x/=f;
        this.y/=f;
        return this;
    }

    public Vector2 set(float f, float f2) {
        this.x = f;
        this.y = f2;
        return this;
    }

    public Vector2 set(Vector2 vector2) {
        this.x = vector2.x;
        this.y = vector2.y;
        return this;
    }

    public Vector2 sub(float f, float f2) {
        this.x-=f;
        this.y-=f2;
        return this;
    }

    public Vector2 sub(Vector2 vector2) {
        this.x-=vector2.x;
        this.y-=vector2.y;
        return this;
    }

    public Vector2 tmp() {
        return Vector2.tmp.set(this);
    }

    public String toString() {
        return "[" + this.x + ":" + this.y + "]";
    }
}

