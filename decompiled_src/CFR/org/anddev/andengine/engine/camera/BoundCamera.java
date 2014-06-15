/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera;

import org.anddev.andengine.engine.camera.Camera;

public class BoundCamera
extends Camera {
    private float mBoundsCenterX;
    private float mBoundsCenterY;
    protected boolean mBoundsEnabled;
    private float mBoundsHeight;
    private float mBoundsMaxX;
    private float mBoundsMaxY;
    private float mBoundsMinX;
    private float mBoundsMinY;
    private float mBoundsWidth;

    public BoundCamera(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    public BoundCamera(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        super(f, f2, f3, f4);
        this.setBounds(f5, f6, f7, f8);
        this.mBoundsEnabled = true;
    }

    /*
     * Enabled aggressive block sorting
     */
    private float determineBoundedX() {
        float f;
        if (this.mBoundsWidth < this.getWidth()) {
            return this.mBoundsCenterX;
        }
        float f2 = this.getCenterX();
        boolean bl = (f = this.mBoundsMinX - this.getMinX()) > 0.0f;
        float f3 = this.getMaxX() - this.mBoundsMaxX;
        boolean bl2 = f3 > 0.0f;
        if (bl) {
            if (!bl2) return f2 + f;
            return f + f2 - f3;
        }
        if (!bl2) return f2;
        return f2 - f3;
    }

    /*
     * Enabled aggressive block sorting
     */
    private float determineBoundedY() {
        float f;
        if (this.mBoundsHeight < this.getHeight()) {
            return this.mBoundsCenterY;
        }
        float f2 = this.getCenterY();
        boolean bl = (f = this.mBoundsMinY - this.getMinY()) > 0.0f;
        float f3 = this.getMaxY() - this.mBoundsMaxY;
        boolean bl2 = f3 > 0.0f;
        if (bl) {
            if (!bl2) return f2 + f;
            return f + f2 - f3;
        }
        if (!bl2) return f2;
        return f2 - f3;
    }

    protected void ensureInBounds() {
        super.setCenter(this.determineBoundedX(), this.determineBoundedY());
    }

    public boolean isBoundsEnabled() {
        return this.mBoundsEnabled;
    }

    public void setBounds(float f, float f2, float f3, float f4) {
        this.mBoundsMinX = f;
        this.mBoundsMaxX = f2;
        this.mBoundsMinY = f3;
        this.mBoundsMaxY = f4;
        this.mBoundsWidth = this.mBoundsMaxX - this.mBoundsMinX;
        this.mBoundsHeight = this.mBoundsMaxY - this.mBoundsMinY;
        this.mBoundsCenterX = this.mBoundsMinX + 0.5f * this.mBoundsWidth;
        this.mBoundsCenterY = this.mBoundsMinY + 0.5f * this.mBoundsHeight;
    }

    public void setBoundsEnabled(boolean bl) {
        this.mBoundsEnabled = bl;
    }

    @Override
    public void setCenter(float f, float f2) {
        super.setCenter(f, f2);
        if (!this.mBoundsEnabled) return;
        this.ensureInBounds();
    }
}

