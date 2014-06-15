package org.anddev.andengine.engine.camera.hud;

import org.anddev.andengine.entity.scene.*;

public class HUD extends CameraScene
{
    public HUD() {
        this(1);
        this.setBackgroundEnabled(false);
    }
    
    public HUD(final int n) {
        super(n);
        this.setBackgroundEnabled(false);
    }
}
