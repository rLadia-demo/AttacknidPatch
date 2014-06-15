/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.input.touch.TouchEvent;

public class CameraScene
extends Scene {
    protected Camera mCamera;

    public CameraScene(int n) {
        this(n, null);
    }

    public CameraScene(int n, Camera camera) {
        super(n);
        this.mCamera = camera;
    }

    public void centerShapeInCamera(Shape shape) {
        Camera camera = this.mCamera;
        shape.setPosition(0.5f * (camera.getWidth() - shape.getWidth()), 0.5f * (camera.getHeight() - shape.getHeight()));
    }

    public void centerShapeInCameraHorizontally(Shape shape) {
        shape.setPosition(0.5f * (this.mCamera.getWidth() - shape.getWidth()), shape.getY());
    }

    public void centerShapeInCameraVertically(Shape shape) {
        shape.setPosition(shape.getX(), 0.5f * (this.mCamera.getHeight() - shape.getHeight()));
    }

    public Camera getCamera() {
        return this.mCamera;
    }

    @Override
    protected boolean onChildSceneTouchEvent(TouchEvent touchEvent) {
        if (!(this.mChildScene instanceof CameraScene)) return super.onChildSceneTouchEvent(touchEvent);
        this.mCamera.convertCameraSceneToSceneTouchEvent(touchEvent);
        boolean bl = super.onChildSceneTouchEvent(touchEvent);
        this.mCamera.convertSceneToCameraSceneTouchEvent(touchEvent);
        return bl;
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        if (this.mCamera == null) return;
        gL10.glMatrixMode(5889);
        this.mCamera.onApplyCameraSceneMatrix(gL10);
        gL10.glMatrixMode(5888);
        gL10.glPushMatrix();
        gL10.glLoadIdentity();
        super.onManagedDraw(gL10, camera);
        gL10.glPopMatrix();
        gL10.glMatrixMode(5889);
    }

    @Override
    public boolean onSceneTouchEvent(TouchEvent touchEvent) {
        if (this.mCamera == null) {
            return false;
        }
        this.mCamera.convertSceneToCameraSceneTouchEvent(touchEvent);
        if (super.onSceneTouchEvent(touchEvent)) {
            return true;
        }
        this.mCamera.convertCameraSceneToSceneTouchEvent(touchEvent);
        return false;
    }

    public void setCamera(Camera camera) {
        this.mCamera = camera;
    }
}

