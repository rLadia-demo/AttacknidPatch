package org.anddev.andengine.util.pool;

import org.anddev.andengine.engine.handler.*;
import java.util.*;

public abstract class PoolUpdateHandler<T extends PoolItem> implements IUpdateHandler
{
    private final Pool<T> mPool;
    private final ArrayList<T> mScheduledPoolItems;
    
    public PoolUpdateHandler() {
        super();
        this.mScheduledPoolItems = new ArrayList<T>();
        this.mPool = new Pool<T>() {
            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }
    
    public PoolUpdateHandler(final int n) {
        super();
        this.mScheduledPoolItems = new ArrayList<T>();
        this.mPool = new Pool<T>(n) {
            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }
    
    public PoolUpdateHandler(final int n, final int n2) {
        super();
        this.mScheduledPoolItems = new ArrayList<T>();
        this.mPool = new Pool<T>(n, n2) {
            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }
    
    public T obtainPoolItem() {
        return this.mPool.obtainPoolItem();
    }
    
    protected abstract T onAllocatePoolItem();
    
    protected abstract void onHandlePoolItem(final T p0);
    
    @Override
    public void onUpdate(final float n) {
        final ArrayList<T> mScheduledPoolItems = this.mScheduledPoolItems;
        synchronized (mScheduledPoolItems) {
            final int size = mScheduledPoolItems.size();
            if (size > 0) {
                final Pool<T> mPool = this.mPool;
                for (int i = 0; i < size; ++i) {
                    final PoolItem poolItem = mScheduledPoolItems.get(i);
                    this.onHandlePoolItem((T)poolItem);
                    mPool.recyclePoolItem((T)poolItem);
                }
                mScheduledPoolItems.clear();
            }
        }
    }
    
    public void postPoolItem(final T t) {
        final ArrayList<T> mScheduledPoolItems = this.mScheduledPoolItems;
        // monitorenter(mScheduledPoolItems)
        // monitorenter(mScheduledPoolItems)
        if (t == null) {
            try {
                throw new IllegalArgumentException("PoolItem already recycled!");
            }
            finally {
            }
            // monitorexit(mScheduledPoolItems)
        }
        if (!this.mPool.ownsPoolItem(t)) {
            throw new IllegalArgumentException("PoolItem from another pool!");
        }
        this.mScheduledPoolItems.add(t);
        // monitorexit(mScheduledPoolItems)
    }
    // monitorexit(mScheduledPoolItems)
    
    @Override
    public void reset() {
        final ArrayList<T> mScheduledPoolItems = this.mScheduledPoolItems;
        synchronized (mScheduledPoolItems) {
            final int size = mScheduledPoolItems.size();
            final Pool<T> mPool = this.mPool;
            for (int i = size - 1; i >= 0; --i) {
                mPool.recyclePoolItem(mScheduledPoolItems.get(i));
            }
            mScheduledPoolItems.clear();
        }
    }
}
