/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.engine;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.input.touch.TouchEvent;

public class SingleSceneSplitScreenEngine
extends Engine {
    private final Camera mSecondCamera;

    public SingleSceneSplitScreenEngine(EngineOptions engineOptions, Camera camera) {
        super(engineOptions);
        this.mSecondCamera = camera;
    }

    protected void convertSurfaceToSceneTouchEvent(Camera camera, TouchEvent touchEvent) {
        int n = this.mSurfaceWidth >> 1;
        if (camera == this.getFirstCamera()) {
            camera.convertSurfaceToSceneTouchEvent(touchEvent, n, this.mSurfaceHeight);
            return;
        }
        touchEvent.offset(- n, 0.0f);
        camera.convertSurfaceToSceneTouchEvent(touchEvent, n, this.mSurfaceHeight);
    }

    @Deprecated
    public Camera getCamera() {
        return this.mCamera;
    }

    protected Camera getCameraFromSurfaceTouchEvent(TouchEvent touchEvent) {
        if (touchEvent.getX() > (float)(this.mSurfaceWidth >> 1)) return this.getSecondCamera();
        return this.getFirstCamera();
    }

    public Camera getFirstCamera() {
        return this.mCamera;
    }

    public Camera getSecondCamera() {
        return this.mSecondCamera;
    }

    protected void onDrawScene(GL10 gL10) {
        Camera camera = this.getFirstCamera();
        Camera camera2 = this.getSecondCamera();
        int n = this.mSurfaceWidth >> 1;
        int n2 = this.mSurfaceHeight;
        gL10.glEnable(3089);
        gL10.glScissor(0, 0, n, n2);
        gL10.glViewport(0, 0, n, n2);
        this.mScene.onDraw(gL10, camera);
        camera.onDrawHUD(gL10);
        gL10.glScissor(n, 0, n, n2);
        gL10.glViewport(n, 0, n, n2);
        this.mScene.onDraw(gL10, camera2);
        camera2.onDrawHUD(gL10);
        gL10.glDisable(3089);
    }

    protected void updateUpdateHandlers(float f) {
        super.updateUpdateHandlers(f);
        this.getSecondCamera().onUpdate(f);
    }
}

