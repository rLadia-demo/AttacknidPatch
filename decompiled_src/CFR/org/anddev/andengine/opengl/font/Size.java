/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.font;

class Size {
    private float mHeight;
    private float mWidth;

    public Size() {
        this(0.0f, 0.0f);
    }

    public Size(float f, float f2) {
        this.setWidth(f);
        this.setHeight(f2);
    }

    public float getHeight() {
        return this.mHeight;
    }

    public float getWidth() {
        return this.mWidth;
    }

    public void set(int n, int n2) {
        this.setWidth(n);
        this.setHeight(n2);
    }

    public void setHeight(float f) {
        this.mHeight = f;
    }

    public void setWidth(float f) {
        this.mWidth = f;
    }
}

