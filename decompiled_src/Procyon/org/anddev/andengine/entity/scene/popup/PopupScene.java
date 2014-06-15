package org.anddev.andengine.entity.scene.popup;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.engine.handler.timer.*;
import org.anddev.andengine.engine.handler.*;

public class PopupScene extends CameraScene
{
    public PopupScene(final Camera camera, final Scene scene, final float n) {
        this(camera, scene, n, null);
    }
    
    public PopupScene(final Camera camera, final Scene scene, final float n, final Runnable runnable) {
        super(1, camera);
        this.setBackgroundEnabled(false);
        scene.setChildScene(this, false, true, true);
        this.registerUpdateHandler(new TimerHandler(n, new ITimerCallback() {
            @Override
            public void onTimePassed(final TimerHandler timerHandler) {
                PopupScene.this.unregisterUpdateHandler(timerHandler);
                scene.clearChildScene();
                if (runnable != null) {
                    runnable.run();
                }
            }
        }));
    }
}
