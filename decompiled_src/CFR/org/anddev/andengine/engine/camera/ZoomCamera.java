/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera;

import org.anddev.andengine.engine.camera.BoundCamera;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.util.MathUtils;

public class ZoomCamera
extends BoundCamera {
    private float mZoomFactor = 1.0f;

    public ZoomCamera(float f, float f2, float f3, float f4) {
        super(f, f2, f3, f4);
    }

    @Override
    protected void applySceneToCameraSceneOffset(TouchEvent touchEvent) {
        float f = this.mZoomFactor;
        if (f != 1.0f) {
            float f2 = this.getCenterX();
            float f3 = this.getCenterY();
            ZoomCamera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            ZoomCamera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.scaleAroundCenter(ZoomCamera.VERTICES_TOUCH_TMP, f, f, f2, f3);
            touchEvent.set(ZoomCamera.VERTICES_TOUCH_TMP[0], ZoomCamera.VERTICES_TOUCH_TMP[1]);
        }
        super.applySceneToCameraSceneOffset(touchEvent);
    }

    @Override
    public float getHeight() {
        return super.getHeight() / this.mZoomFactor;
    }

    @Override
    public float getMaxX() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMaxX();
        }
        float f = this.getCenterX();
        return f + (super.getMaxX() - f) / this.mZoomFactor;
    }

    @Override
    public float getMaxY() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMaxY();
        }
        float f = this.getCenterY();
        return f + (super.getMaxY() - f) / this.mZoomFactor;
    }

    @Override
    public float getMinX() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMinX();
        }
        float f = this.getCenterX();
        return f - (f - super.getMinX()) / this.mZoomFactor;
    }

    @Override
    public float getMinY() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMinY();
        }
        float f = this.getCenterY();
        return f - (f - super.getMinY()) / this.mZoomFactor;
    }

    @Override
    public float getWidth() {
        return super.getWidth() / this.mZoomFactor;
    }

    public float getZoomFactor() {
        return this.mZoomFactor;
    }

    public void setZoomFactor(float f) {
        this.mZoomFactor = f;
        if (!this.mBoundsEnabled) return;
        this.ensureInBounds();
    }

    @Override
    protected void unapplySceneToCameraSceneOffset(TouchEvent touchEvent) {
        super.unapplySceneToCameraSceneOffset(touchEvent);
        float f = this.mZoomFactor;
        if (f == 1.0f) return;
        float f2 = this.getCenterX();
        float f3 = this.getCenterY();
        ZoomCamera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
        ZoomCamera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
        MathUtils.revertScaleAroundCenter(ZoomCamera.VERTICES_TOUCH_TMP, f, f, f2, f3);
        touchEvent.set(ZoomCamera.VERTICES_TOUCH_TMP[0], ZoomCamera.VERTICES_TOUCH_TMP[1]);
    }
}

