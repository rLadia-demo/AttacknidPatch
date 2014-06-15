package org.anddev.andengine.util.pool;

public class EntityRemoveRunnablePoolUpdateHandler extends RunnablePoolUpdateHandler<EntityRemoveRunnablePoolItem>
{
    @Override
    protected EntityRemoveRunnablePoolItem onAllocatePoolItem() {
        return new EntityRemoveRunnablePoolItem();
    }
}
