package org.anddev.andengine.engine;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.input.touch.*;
import javax.microedition.khronos.opengles.*;

public class SingleSceneSplitScreenEngine extends Engine
{
    private final Camera mSecondCamera;
    
    public SingleSceneSplitScreenEngine(final EngineOptions engineOptions, final Camera mSecondCamera) {
        super(engineOptions);
        this.mSecondCamera = mSecondCamera;
    }
    
    @Override
    protected void convertSurfaceToSceneTouchEvent(final Camera camera, final TouchEvent touchEvent) {
        final int n = this.mSurfaceWidth >> 1;
        if (camera == this.getFirstCamera()) {
            camera.convertSurfaceToSceneTouchEvent(touchEvent, n, this.mSurfaceHeight);
            return;
        }
        touchEvent.offset(-n, 0.0f);
        camera.convertSurfaceToSceneTouchEvent(touchEvent, n, this.mSurfaceHeight);
    }
    
    @Deprecated
    @Override
    public Camera getCamera() {
        return super.mCamera;
    }
    
    @Override
    protected Camera getCameraFromSurfaceTouchEvent(final TouchEvent touchEvent) {
        if (touchEvent.getX() <= this.mSurfaceWidth >> 1) {
            return this.getFirstCamera();
        }
        return this.getSecondCamera();
    }
    
    public Camera getFirstCamera() {
        return super.mCamera;
    }
    
    public Camera getSecondCamera() {
        return this.mSecondCamera;
    }
    
    @Override
    protected void onDrawScene(final GL10 gl10) {
        final Camera firstCamera = this.getFirstCamera();
        final Camera secondCamera = this.getSecondCamera();
        final int n = this.mSurfaceWidth >> 1;
        final int mSurfaceHeight = this.mSurfaceHeight;
        gl10.glEnable(3089);
        gl10.glScissor(0, 0, n, mSurfaceHeight);
        gl10.glViewport(0, 0, n, mSurfaceHeight);
        super.mScene.onDraw(gl10, firstCamera);
        firstCamera.onDrawHUD(gl10);
        gl10.glScissor(n, 0, n, mSurfaceHeight);
        gl10.glViewport(n, 0, n, mSurfaceHeight);
        super.mScene.onDraw(gl10, secondCamera);
        secondCamera.onDrawHUD(gl10);
        gl10.glDisable(3089);
    }
    
    @Override
    protected void updateUpdateHandlers(final float n) {
        super.updateUpdateHandlers(n);
        this.getSecondCamera().onUpdate(n);
    }
}
