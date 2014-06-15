package org.anddev.andengine.engine.camera;

import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.util.*;

public class ZoomCamera extends BoundCamera
{
    private float mZoomFactor;
    
    public ZoomCamera(final float n, final float n2, final float n3, final float n4) {
        super(n, n2, n3, n4);
        this.mZoomFactor = 1.0f;
    }
    
    @Override
    protected void applySceneToCameraSceneOffset(final TouchEvent touchEvent) {
        final float mZoomFactor = this.mZoomFactor;
        if (mZoomFactor != 1.0f) {
            final float centerX = this.getCenterX();
            final float centerY = this.getCenterY();
            ZoomCamera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            ZoomCamera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.scaleAroundCenter(ZoomCamera.VERTICES_TOUCH_TMP, mZoomFactor, mZoomFactor, centerX, centerY);
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
        final float centerX = this.getCenterX();
        return centerX + (super.getMaxX() - centerX) / this.mZoomFactor;
    }
    
    @Override
    public float getMaxY() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMaxY();
        }
        final float centerY = this.getCenterY();
        return centerY + (super.getMaxY() - centerY) / this.mZoomFactor;
    }
    
    @Override
    public float getMinX() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMinX();
        }
        final float centerX = this.getCenterX();
        return centerX - (centerX - super.getMinX()) / this.mZoomFactor;
    }
    
    @Override
    public float getMinY() {
        if (this.mZoomFactor == 1.0f) {
            return super.getMinY();
        }
        final float centerY = this.getCenterY();
        return centerY - (centerY - super.getMinY()) / this.mZoomFactor;
    }
    
    @Override
    public float getWidth() {
        return super.getWidth() / this.mZoomFactor;
    }
    
    public float getZoomFactor() {
        return this.mZoomFactor;
    }
    
    public void setZoomFactor(final float mZoomFactor) {
        this.mZoomFactor = mZoomFactor;
        if (this.mBoundsEnabled) {
            this.ensureInBounds();
        }
    }
    
    @Override
    protected void unapplySceneToCameraSceneOffset(final TouchEvent touchEvent) {
        super.unapplySceneToCameraSceneOffset(touchEvent);
        final float mZoomFactor = this.mZoomFactor;
        if (mZoomFactor != 1.0f) {
            final float centerX = this.getCenterX();
            final float centerY = this.getCenterY();
            ZoomCamera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            ZoomCamera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.revertScaleAroundCenter(ZoomCamera.VERTICES_TOUCH_TMP, mZoomFactor, mZoomFactor, centerX, centerY);
            touchEvent.set(ZoomCamera.VERTICES_TOUCH_TMP[0], ZoomCamera.VERTICES_TOUCH_TMP[1]);
        }
    }
}
