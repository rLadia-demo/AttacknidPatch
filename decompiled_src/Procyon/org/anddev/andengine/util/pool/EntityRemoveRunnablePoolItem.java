package org.anddev.andengine.util.pool;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.entity.layer.*;

public class EntityRemoveRunnablePoolItem extends RunnablePoolItem
{
    protected IEntity mEntity;
    protected ILayer mLayer;
    
    @Override
    public void run() {
        this.mLayer.removeEntity(this.mEntity);
    }
    
    public void set(final IEntity mEntity, final ILayer mLayer) {
        this.mEntity = mEntity;
        this.mLayer = mLayer;
    }
    
    public void setEntity(final IEntity mEntity) {
        this.mEntity = mEntity;
    }
    
    public void setLayer(final ILayer mLayer) {
        this.mLayer = mLayer;
    }
}
