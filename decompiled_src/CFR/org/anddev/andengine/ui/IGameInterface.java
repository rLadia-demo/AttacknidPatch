/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.ui;

import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.entity.scene.Scene;

public interface IGameInterface {
    public void onGamePaused();

    public void onGameResumed();

    public void onLoadComplete();

    public Engine onLoadEngine();

    public void onLoadResources();

    public Scene onLoadScene();

    public void onUnloadResources();
}

