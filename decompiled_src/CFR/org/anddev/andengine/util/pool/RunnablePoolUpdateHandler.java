/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import org.anddev.andengine.util.pool.PoolItem;
import org.anddev.andengine.util.pool.PoolUpdateHandler;
import org.anddev.andengine.util.pool.RunnablePoolItem;

public abstract class RunnablePoolUpdateHandler<T extends RunnablePoolItem>
extends PoolUpdateHandler<T> {
    public RunnablePoolUpdateHandler() {
    }

    public RunnablePoolUpdateHandler(int n) {
        super(n);
    }

    @Override
    protected abstract T onAllocatePoolItem();

    @Override
    protected void onHandlePoolItem(T T) {
        T.run();
    }
}

