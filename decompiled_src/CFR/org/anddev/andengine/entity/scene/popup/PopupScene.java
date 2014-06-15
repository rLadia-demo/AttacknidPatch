/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.popup;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.timer.ITimerCallback;
import org.anddev.andengine.engine.handler.timer.TimerHandler;
import org.anddev.andengine.entity.scene.CameraScene;
import org.anddev.andengine.entity.scene.Scene;

public class PopupScene
extends CameraScene {
    public PopupScene(Camera camera, Scene scene, float f) {
        this(camera, scene, f, null);
    }

    public PopupScene(Camera camera, Scene scene, float f, Runnable runnable) {
        super(1, camera);
        this.setBackgroundEnabled(false);
        scene.setChildScene(this, false, true, true);
        this.registerUpdateHandler((IUpdateHandler)new TimerHandler(f, new ITimerCallback(){

            @Override
            public void onTimePassed(TimerHandler timerHandler) {
                PopupScene.this.unregisterUpdateHandler((IUpdateHandler)timerHandler);
                scene.clearChildScene();
                if (runnable == null) return;
                runnable.run();
            }
        }));
    }

}

