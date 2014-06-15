/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import org.anddev.andengine.util.pool.EntityRemoveRunnablePoolItem;
import org.anddev.andengine.util.pool.RunnablePoolItem;
import org.anddev.andengine.util.pool.RunnablePoolUpdateHandler;

public class EntityRemoveRunnablePoolUpdateHandler
extends RunnablePoolUpdateHandler<EntityRemoveRunnablePoolItem> {
    @Override
    protected EntityRemoveRunnablePoolItem onAllocatePoolItem() {
        return new EntityRemoveRunnablePoolItem();
    }
}

