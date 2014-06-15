package org.anddev.andengine.engine.camera;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.engine.camera.hud.*;
import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.collision.*;
import org.anddev.andengine.opengl.util.*;

public class Camera implements IUpdateHandler
{
    protected static final float[] VERTICES_TOUCH_TMP;
    protected float mCameraSceneRotation;
    private IShape mChaseShape;
    private float mFarZ;
    private HUD mHUD;
    private float mMaxX;
    private float mMaxY;
    private float mMinX;
    private float mMinY;
    private float mNearZ;
    protected float mRotation;
    
    static {
        VERTICES_TOUCH_TMP = new float[2];
    }
    
    public Camera(final float mMinX, final float mMinY, final float n, final float n2) {
        super();
        this.mNearZ = -1.0f;
        this.mFarZ = 1.0f;
        this.mRotation = 0.0f;
        this.mCameraSceneRotation = 0.0f;
        this.mMinX = mMinX;
        this.mMaxX = mMinX + n;
        this.mMinY = mMinY;
        this.mMaxY = mMinY + n2;
    }
    
    private void applyCameraSceneRotation(final TouchEvent touchEvent) {
        final float n = -this.mCameraSceneRotation;
        if (n != 0.0f) {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, n, 0.5f * (this.mMaxX - this.mMinX), 0.5f * (this.mMaxY - this.mMinY));
            touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
        }
    }
    
    private void applyRotation(final GL10 gl10, final float n, final float n2, final float n3) {
        gl10.glTranslatef(n, n2, 0.0f);
        gl10.glRotatef(n3, 0.0f, 0.0f, 1.0f);
        gl10.glTranslatef(-n, -n2, 0.0f);
    }
    
    private void applySceneRotation(final TouchEvent touchEvent) {
        final float n = -this.mRotation;
        if (n != 0.0f) {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, n, this.getCenterX(), this.getCenterY());
            touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
        }
    }
    
    private void convertAxisAlignedSurfaceToSceneTouchEvent(final TouchEvent touchEvent, final float n, final float n2) {
        final float minX = this.getMinX();
        final float maxX = this.getMaxX();
        final float minY = this.getMinY();
        touchEvent.set(minX + n * (maxX - minX), minY + n2 * (this.getMaxY() - minY));
    }
    
    private void unapplyCameraSceneRotation(final TouchEvent touchEvent) {
        final float n = -this.mCameraSceneRotation;
        if (n != 0.0f) {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.revertRotateAroundCenter(Camera.VERTICES_TOUCH_TMP, n, 0.5f * (this.mMaxX - this.mMinX), 0.5f * (this.mMaxY - this.mMinY));
            touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
        }
    }
    
    private void unapplySceneRotation(final TouchEvent touchEvent) {
        final float mRotation = this.mRotation;
        if (mRotation != 0.0f) {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.revertRotateAroundCenter(Camera.VERTICES_TOUCH_TMP, mRotation, this.getCenterX(), this.getCenterY());
            touchEvent.set(Camera.VERTICES_TOUCH_TMP[0], Camera.VERTICES_TOUCH_TMP[1]);
        }
    }
    
    protected void applySceneToCameraSceneOffset(final TouchEvent touchEvent) {
        touchEvent.offset(-this.mMinX, -this.mMinY);
    }
    
    public void convertCameraSceneToSceneTouchEvent(final TouchEvent touchEvent) {
        this.unapplyCameraSceneRotation(touchEvent);
        this.unapplySceneToCameraSceneOffset(touchEvent);
        this.applySceneRotation(touchEvent);
    }
    
    public void convertSceneToCameraSceneTouchEvent(final TouchEvent touchEvent) {
        this.unapplySceneRotation(touchEvent);
        this.applySceneToCameraSceneOffset(touchEvent);
        this.applyCameraSceneRotation(touchEvent);
    }
    
    public void convertSurfaceToSceneTouchEvent(final TouchEvent touchEvent, final int n, final int n2) {
        final float mRotation = this.mRotation;
        float n3;
        float n4;
        if (mRotation == 0.0f) {
            n3 = touchEvent.getX() / n;
            n4 = touchEvent.getY() / n2;
        }
        else if (mRotation == 180.0f) {
            n3 = 1.0f - touchEvent.getX() / n;
            n4 = 1.0f - touchEvent.getY() / n2;
        }
        else {
            Camera.VERTICES_TOUCH_TMP[0] = touchEvent.getX();
            Camera.VERTICES_TOUCH_TMP[1] = touchEvent.getY();
            MathUtils.rotateAroundCenter(Camera.VERTICES_TOUCH_TMP, mRotation, n / 2, n2 / 2);
            n3 = Camera.VERTICES_TOUCH_TMP[0] / n;
            n4 = Camera.VERTICES_TOUCH_TMP[1] / n2;
        }
        this.convertAxisAlignedSurfaceToSceneTouchEvent(touchEvent, n3, n4);
    }
    
    public float getCameraSceneRotation() {
        return this.mCameraSceneRotation;
    }
    
    public float getCenterX() {
        final float mMinX = this.mMinX;
        return mMinX + 0.5f * (this.mMaxX - mMinX);
    }
    
    public float getCenterY() {
        final float mMinY = this.mMinY;
        return mMinY + 0.5f * (this.mMaxY - mMinY);
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
        return this.mHUD != null;
    }
    
    public boolean isRectangularShapeVisible(final RectangularShape rectangularShape) {
        final float x = rectangularShape.getX();
        final float y = rectangularShape.getY();
        return BaseCollisionChecker.checkAxisAlignedRectangleCollision(this.getMinX(), this.getMinY(), this.getMaxX(), this.getMaxY(), x, y, x + rectangularShape.getWidthScaled(), y + rectangularShape.getHeightScaled());
    }
    
    public void offsetCenter(final float n, final float n2) {
        this.setCenter(n + this.getCenterX(), n2 + this.getCenterY());
    }
    
    public void onApplyCameraSceneMatrix(final GL10 projectionIdentityMatrix) {
        GLHelper.setProjectionIdentityMatrix(projectionIdentityMatrix);
        final float n = this.mMaxX - this.mMinX;
        final float n2 = this.mMaxY - this.mMinY;
        projectionIdentityMatrix.glOrthof(0.0f, n, n2, 0.0f, this.mNearZ, this.mFarZ);
        final float mCameraSceneRotation = this.mCameraSceneRotation;
        if (mCameraSceneRotation != 0.0f) {
            this.applyRotation(projectionIdentityMatrix, n * 0.5f, n2 * 0.5f, mCameraSceneRotation);
        }
    }
    
    public void onApplyMatrix(final GL10 projectionIdentityMatrix) {
        GLHelper.setProjectionIdentityMatrix(projectionIdentityMatrix);
        projectionIdentityMatrix.glOrthof(this.getMinX(), this.getMaxX(), this.getMaxY(), this.getMinY(), this.mNearZ, this.mFarZ);
        final float mRotation = this.mRotation;
        if (mRotation != 0.0f) {
            this.applyRotation(projectionIdentityMatrix, this.getCenterX(), this.getCenterY(), mRotation);
        }
    }
    
    public void onApplyPositionIndependentMatrix(final GL10 projectionIdentityMatrix) {
        GLHelper.setProjectionIdentityMatrix(projectionIdentityMatrix);
        final float n = this.mMaxX - this.mMinX;
        final float n2 = this.mMaxY - this.mMinY;
        projectionIdentityMatrix.glOrthof(0.0f, n, n2, 0.0f, this.mNearZ, this.mFarZ);
        final float mRotation = this.mRotation;
        if (mRotation != 0.0f) {
            this.applyRotation(projectionIdentityMatrix, n * 0.5f, n2 * 0.5f, mRotation);
        }
    }
    
    public void onDrawHUD(final GL10 gl10) {
        if (this.mHUD != null) {
            this.mHUD.onDraw(gl10, this);
        }
    }
    
    @Override
    public void onUpdate(final float n) {
        if (this.mHUD != null) {
            this.mHUD.onUpdate(n);
        }
        if (this.mChaseShape != null) {
            final float[] sceneCenterCoordinates = this.mChaseShape.getSceneCenterCoordinates();
            this.setCenter(sceneCenterCoordinates[0], sceneCenterCoordinates[1]);
        }
    }
    
    @Override
    public void reset() {
    }
    
    public void setCameraSceneRotation(final float mCameraSceneRotation) {
        this.mCameraSceneRotation = mCameraSceneRotation;
    }
    
    public void setCenter(final float n, final float n2) {
        final float n3 = n - this.getCenterX();
        final float n4 = n2 - this.getCenterY();
        this.mMinX += n3;
        this.mMaxX += n3;
        this.mMinY += n4;
        this.mMaxY += n4;
    }
    
    public void setChaseShape(final IShape mChaseShape) {
        this.mChaseShape = mChaseShape;
    }
    
    public void setFarZClippingPlane(final float mFarZ) {
        this.mFarZ = mFarZ;
    }
    
    public void setHUD(final HUD mhud) {
        (this.mHUD = mhud).setCamera(this);
    }
    
    public void setNearZClippingPlane(final float mNearZ) {
        this.mNearZ = mNearZ;
    }
    
    public void setRotation(final float mRotation) {
        this.mRotation = mRotation;
    }
    
    public void setZClippingPlanes(final float mNearZ, final float mFarZ) {
        this.mNearZ = mNearZ;
        this.mFarZ = mFarZ;
    }
    
    protected void unapplySceneToCameraSceneOffset(final TouchEvent touchEvent) {
        touchEvent.offset(this.mMinX, this.mMinY);
    }
}
