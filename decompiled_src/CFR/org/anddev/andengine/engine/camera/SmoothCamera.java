/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera;

import org.anddev.andengine.engine.camera.ZoomCamera;

public class SmoothCamera
extends ZoomCamera {
    private float mMaxVelocityX;
    private float mMaxVelocityY;
    private float mMaxZoomFactorChange;
    private float mTargetCenterX;
    private float mTargetCenterY;
    private float mTargetZoomFactor;

    public SmoothCamera(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        super(f, f2, f3, f4);
        this.mMaxVelocityX = f5;
        this.mMaxVelocityY = f6;
        this.mMaxZoomFactorChange = f7;
        this.mTargetCenterX = this.getCenterX();
        this.mTargetCenterY = this.getCenterY();
        this.mTargetZoomFactor = 1.0f;
    }

    private float cutToMaxVelocityX(float f, float f2) {
        if (f <= 0.0f) return Math.max(f, f2 * (- this.mMaxVelocityX));
        return Math.min(f, f2 * this.mMaxVelocityX);
    }

    private float cutToMaxVelocityY(float f, float f2) {
        if (f <= 0.0f) return Math.max(f, f2 * (- this.mMaxVelocityY));
        return Math.min(f, f2 * this.mMaxVelocityY);
    }

    private float cutToMaxZoomFactorChange(float f, float f2) {
        if (f <= 0.0f) return Math.max(f, f2 * (- this.mMaxZoomFactorChange));
        return Math.min(f, f2 * this.mMaxZoomFactorChange);
    }

    @Override
    public void onUpdate(float f) {
        float f2;
        float f3;
        super.onUpdate(f);
        float f4 = this.getCenterX();
        float f5 = this.getCenterY();
        float f6 = this.mTargetCenterX;
        float f7 = this.mTargetCenterY;
        if (f4 != f6 || f5 != f7) {
            float f8 = this.cutToMaxVelocityX(f6 - f4, f);
            float f9 = this.cutToMaxVelocityY(f7 - f5, f);
            super.setCenter(f4 + f8, f5 + f9);
        }
        if ((f3 = this.getZoomFactor()) == (f2 = this.mTargetZoomFactor)) return;
        super.setZoomFactor(f3 + this.cutToMaxZoomFactorChange(f2 - f3, f));
    }

    @Override
    public void setCenter(float f, float f2) {
        this.mTargetCenterX = f;
        this.mTargetCenterY = f2;
    }

    public void setCenterDirect(float f, float f2) {
        super.setCenter(f, f2);
        this.mTargetCenterX = f;
        this.mTargetCenterY = f2;
    }

    public void setMaxVelocityX(float f) {
        this.mMaxVelocityX = f;
    }

    public void setMaxVelocityX(float f, float f2) {
        this.mMaxVelocityX = f;
        this.mMaxVelocityY = f2;
    }

    public void setMaxVelocityY(float f) {
        this.mMaxVelocityY = f;
    }

    public void setMaxZoomFactorChange(float f) {
        this.mMaxZoomFactorChange = f;
    }

    @Override
    public void setZoomFactor(float f) {
        this.mTargetZoomFactor = f;
    }
}

