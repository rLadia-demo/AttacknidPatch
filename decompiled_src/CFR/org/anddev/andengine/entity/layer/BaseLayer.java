/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;

public abstract class BaseLayer
extends Entity
implements ILayer {
    private final ArrayList<Scene.ITouchArea> mTouchAreas = new ArrayList<Scene.ITouchArea>();

    public BaseLayer() {
    }

    public BaseLayer(int n) {
        super(n);
    }

    @Override
    public ArrayList<Scene.ITouchArea> getTouchAreas() {
        return this.mTouchAreas;
    }

    @Override
    public void registerTouchArea(Scene.ITouchArea iTouchArea) {
        this.mTouchAreas.add(iTouchArea);
    }

    @Override
    public void unregisterTouchArea(Scene.ITouchArea iTouchArea) {
        this.mTouchAreas.remove(iTouchArea);
    }
}

