/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.util.pool.RunnablePoolItem;

public class EntityRemoveRunnablePoolItem
extends RunnablePoolItem {
    protected IEntity mEntity;
    protected ILayer mLayer;

    @Override
    public void run() {
        this.mLayer.removeEntity(this.mEntity);
    }

    public void set(IEntity iEntity, ILayer iLayer) {
        this.mEntity = iEntity;
        this.mLayer = iLayer;
    }

    public void setEntity(IEntity iEntity) {
        this.mEntity = iEntity;
    }

    public void setLayer(ILayer iLayer) {
        this.mLayer = iLayer;
    }
}

