/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.engine.camera;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.collision.BaseCollisionChecker;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.util.MathUtils;

public class Camera
implements IUpdateHandler {
    protected static final float[] VERTICES_TOUCH_TMP = new float[2];
    protected float mCameraSceneRotation = 0.0f;
    private IShape mChaseShape;
    private float mFarZ = 1.0f;
    private HUD mHUD;
    private float mMaxX;
    private float mMaxY;
    private float mMinX;
    private float mMinY;
    private float mNearZ = -1.0f;
    protected float mRotation = 0.0f;

    public Camera(float f, float f2, float f3, float f4) {
        this.mMinX = f;
        this.mMaxX = f + f3;
        this.mMinY = f2;
        this.mMaxY = f2 + f4;
    }

    private void applyCameraSceneRotation(TouchEvent touchEvent) {
        float f = - this.mCameraSceneRotation;
        if (f == 0.0f) return;
        Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
        Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
        MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, f, 0.5f * (this.mMaxX - this.mMinX), 0.5f * (this.mMaxY - this.mMinY));
        touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
    }

    private void applyRotation(GL10 gL10, float f, float f2, float f3) {
        gL10.glTranslatef(f, f2, 0.0f);
        gL10.glRotatef(f3, 0.0f, 0.0f, 1.0f);
        gL10.glTranslatef(- f, - f2, 0.0f);
    }

    private void applySceneRotation(TouchEvent touchEvent) {
        float f = - this.mRotation;
        if (f == 0.0f) return;
        Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
        Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
        MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, f, this.getCenterX(), this.getCenterY());
        touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
    }

    private void convertAxisAlignedSurfaceToSceneTouchEvent(TouchEvent touchEvent, float f, float f2) {
        float f3 = this.getMinX();
        float f4 = this.getMaxX();
        float f5 = this.getMinY();
        float f6 = this.getMaxY();
        touchEvent.set(f3 + f * (f4 - f3), f5 + f2 * (f6 - f5));
    }

    private void unapplyCameraSceneRotation(TouchEvent touchEvent) {
        float f = - this.mCameraSceneRotation;
        if (f == 0.0f) return;
        Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
        Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
        MathUtils.revertRotateAroundCenter(Camera.VERTICES_TOUCH_TMP, f, 0.5f * (this.mMaxX - this.mMinX), 0.5f * (this.mMaxY - this.mMinY));
        touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
    }

    private void unapplySceneRotation(TouchEvent touchEvent) {
        float f = this.mRotation;
        if (f == 0.0f) return;
        Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
        Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
        MathUtils.revertRotateAroundCenter(Camera.VERTICES_TOUCH_TMP, f, this.getCenterX(), this.getCenterY());
        touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
    }

    protected void applySceneToCameraSceneOffset(TouchEvent touchEvent) {
        touchEvent.offset(- this.mMinX, - this.mMinY);
    }

    public void convertCameraSceneToSceneTouchEvent(TouchEvent touchEvent) {
        this.unapplyCameraSceneRotation(touchEvent);
        this.unapplySceneToCameraSceneOffset(touchEvent);
        this.applySceneRotation(touchEvent);
    }

    public void convertSceneToCameraSceneTouchEvent(TouchEvent touchEvent) {
        this.unapplySceneRotation(touchEvent);
        this.applySceneToCameraSceneOffset(touchEvent);
        this.applyCameraSceneRotation(touchEvent);
    }

    /*
     * Enabled aggressive block sorting
     */
    public void convertSurfaceToSceneTouchEvent(TouchEvent touchEvent, int n, int n2) {
        float f;
        float f2;
        float f3 = this.mRotation;
        if (f3 == 0.0f) {
            f = touchEvent.getX() / (float)n;
            f2 = touchEvent.getY() / (float)n2;
        } else if (f3 == 180.0f) {
            f = 1.0f - touchEvent.getX() / (float)n;
            f2 = 1.0f - touchEvent.getY() / (float)n2;
        } else {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, f3, n / 2, n2 / 2);
            f = Camera.VERTICES_TOUCH_TMP[0] / (float)n;
            f2 = Camera.VERTICES_TOUCH_TMP[1] / (float)n2;
        }
        this.convertAxisAlignedSurfaceToSceneTouchEvent(touchEvent, f, f2);
    }

    public float getCameraSceneRotation() {
        return this.mCameraSceneRotation;
    }

    public float getCenterX() {
        float f = this.mMinX;
        return f + 0.5f * (this.mMaxX - f);
    }

    public float getCenterY() {
        float f = this.mMinY;
        return f + 0.5f * (this.mMaxY - f);
    }

    public float getFarZClippingPlane() {
        return this.mFarZ;
    }

    public HUD getHUD() {
        return this.mHUD;
    }

    public float getHeight() {
        return this.mMaxY - this.mMinY;
    }

    public float getMaxX() {
        return this.mMaxX;
    }

    public float getMaxY() {
        return this.mMaxY;
    }

    public float getMinX() {
        return this.mMinX;
    }

    public float getMinY() {
        return this.mMinY;
    }

    public float getNearZClippingPlane() {
        return this.mNearZ;
    }

    public float getRotation() {
        return this.mRotation;
    }

    public float getWidth() {
        return this.mMaxX - this.mMinX;
    }

    public boolean hasHUD() {
        if (this.mHUD == null) return false;
        return true;
    }

    public boolean isRectangularShapeVisible(RectangularShape rectangularShape) {
        float f = rectangularShape.getX();
        float f2 = rectangularShape.getY();
        float f3 = f + rectangularShape.getWidthScaled();
        float f4 = f2 + rectangularShape.getHeightScaled();
        return BaseCollisionChecker.checkAxisAlignedRectangleCollision(this.getMinX(), this.getMinY(), this.getMaxX(), this.getMaxY(), f, f2, f3, f4);
    }

    public void offsetCenter(float f, float f2) {
        this.setCenter(f + this.getCenterX(), f2 + this.getCenterY());
    }

    public void onApplyCameraSceneMatrix(GL10 gL10) {
        GLHelper.setProjectionIdentityMatrix(gL10);
        float f = this.mMaxX - this.mMinX;
        float f2 = this.mMaxY - this.mMinY;
        gL10.glOrthof(0.0f, f, f2, 0.0f, this.mNearZ, this.mFarZ);
        float f3 = this.mCameraSceneRotation;
        if (f3 == 0.0f) return;
        this.applyRotation(gL10, f * 0.5f, f2 * 0.5f, f3);
    }

    public void onApplyMatrix(GL10 gL10) {
        GLHelper.setProjectionIdentityMatrix(gL10);
        gL10.glOrthof(this.getMinX(), this.getMaxX(), this.getMaxY(), this.getMinY(), this.mNearZ, this.mFarZ);
        float f = this.mRotation;
        if (f == 0.0f) return;
        this.applyRotation(gL10, this.getCenterX(), this.getCenterY(), f);
    }

    public void onApplyPositionIndependentMatrix(GL10 gL10) {
        GLHelper.setProjectionIdentityMatrix(gL10);
        float f = this.mMaxX - this.mMinX;
        float f2 = this.mMaxY - this.mMinY;
        gL10.glOrthof(0.0f, f, f2, 0.0f, this.mNearZ, this.mFarZ);
        float f3 = this.mRotation;
        if (f3 == 0.0f) return;
        this.applyRotation(gL10, f * 0.5f, f2 * 0.5f, f3);
    }

    public void onDrawHUD(GL10 gL10) {
        if (this.mHUD == null) return;
        this.mHUD.onDraw(gL10, this);
    }

    @Override
    public void onUpdate(float f) {
        if (this.mHUD != null) {
            this.mHUD.onUpdate(f);
        }
        if (this.mChaseShape == null) return;
        float[] arrf = this.mChaseShape.getSceneCenterCoordinates();
        this.setCenter(arrf[0], arrf[1]);
    }

    @Override
    public void reset() {
    }

    public void setCameraSceneRotation(float f) {
        this.mCameraSceneRotation = f;
    }

    public void setCenter(float f, float f2) {
        float f3 = f - this.getCenterX();
        float f4 = f2 - this.getCenterY();
        this.mMinX = f3 + this.mMinX;
        this.mMaxX = f3 + this.mMaxX;
        this.mMinY = f4 + this.mMinY;
        this.mMaxY = f4 + this.mMaxY;
    }

    public void setChaseShape(IShape iShape) {
        this.mChaseShape = iShape;
    }

    public void setFarZClippingPlane(float f) {
        this.mFarZ = f;
    }

    public void setHUD(HUD hUD) {
        this.mHUD = hUD;
        hUD.setCamera(this);
    }

    public void setNearZClippingPlane(float f) {
        this.mNearZ = f;
    }

    public void setRotation(float f) {
        this.mRotation = f;
    }

    public void setZClippingPlanes(float f, float f2) {
        this.mNearZ = f;
        this.mFarZ = f2;
    }

    protected void unapplySceneToCameraSceneOffset(TouchEvent touchEvent) {
        touchEvent.offset(this.mMinX, this.mMinY);
    }
}

