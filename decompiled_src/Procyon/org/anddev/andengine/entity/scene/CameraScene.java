package org.anddev.andengine.entity.scene;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.input.touch.*;
import javax.microedition.khronos.opengles.*;

public class CameraScene extends Scene
{
    protected Camera mCamera;
    
    public CameraScene(final int n) {
        this(n, null);
    }
    
    public CameraScene(final int n, final Camera mCamera) {
        super(n);
        this.mCamera = mCamera;
    }
    
    public void centerShapeInCamera(final Shape shape) {
        final Camera mCamera = this.mCamera;
        shape.setPosition(0.5f * (mCamera.getWidth() - shape.getWidth()), 0.5f * (mCamera.getHeight() - shape.getHeight()));
    }
    
    public void centerShapeInCameraHorizontally(final Shape shape) {
        shape.setPosition(0.5f * (this.mCamera.getWidth() - shape.getWidth()), shape.getY());
    }
    
    public void centerShapeInCameraVertically(final Shape shape) {
        shape.setPosition(shape.getX(), 0.5f * (this.mCamera.getHeight() - shape.getHeight()));
    }
    
    public Camera getCamera() {
        return this.mCamera;
    }
    
    @Override
    protected boolean onChildSceneTouchEvent(final TouchEvent touchEvent) {
        if (this.mChildScene instanceof CameraScene) {
            this.mCamera.convertCameraSceneToSceneTouchEvent(touchEvent);
            final boolean onChildSceneTouchEvent = super.onChildSceneTouchEvent(touchEvent);
            this.mCamera.convertSceneToCameraSceneTouchEvent(touchEvent);
            return onChildSceneTouchEvent;
        }
        return super.onChildSceneTouchEvent(touchEvent);
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        if (this.mCamera != null) {
            gl10.glMatrixMode(5889);
            this.mCamera.onApplyCameraSceneMatrix(gl10);
            gl10.glMatrixMode(5888);
            gl10.glPushMatrix();
            gl10.glLoadIdentity();
            super.onManagedDraw(gl10, camera);
            gl10.glPopMatrix();
            gl10.glMatrixMode(5889);
        }
    }
    
    @Override
    public boolean onSceneTouchEvent(final TouchEvent touchEvent) {
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
    
    public void setCamera(final Camera mCamera) {
        this.mCamera = mCamera;
    }
}
