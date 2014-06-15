/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera.hud;

import org.anddev.andengine.entity.scene.CameraScene;

public class HUD
extends CameraScene {
    public HUD() {
        this(1);
        this.setBackgroundEnabled(false);
    }

    public HUD(int n) {
        super(n);
        this.setBackgroundEnabled(false);
    }
}

