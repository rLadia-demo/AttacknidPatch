/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.util.pool.Pool;
import org.anddev.andengine.util.pool.PoolItem;

public abstract class PoolUpdateHandler<T extends PoolItem>
implements IUpdateHandler {
    private final Pool<T> mPool;
    private final ArrayList<T> mScheduledPoolItems = new ArrayList<T>();

    public PoolUpdateHandler() {
        this.mPool = new Pool<T>(){

            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }

    public PoolUpdateHandler(int n) {
        this.mPool = new Pool<T>(n){

            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }

    public PoolUpdateHandler(int n, int n2) {
        this.mPool = new Pool<T>(n, n2){

            @Override
            protected T onAllocatePoolItem() {
                return PoolUpdateHandler.this.onAllocatePoolItem();
            }
        };
    }

    public T obtainPoolItem() {
        return (PoolItem)this.mPool.obtainPoolItem();
    }

    protected abstract T onAllocatePoolItem();

    protected abstract void onHandlePoolItem(T var1);

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void onUpdate(float f) {
        ArrayList<T> arrayList = this.mScheduledPoolItems;
        synchronized (arrayList) {
            int n = arrayList.size();
            if (n <= 0) return;
            Pool<PoolItem> pool = this.mPool;
            for (int i = 0; i < n; ++i) {
                PoolItem poolItem = (PoolItem)arrayList.get(i);
                this.onHandlePoolItem(poolItem);
                pool.recyclePoolItem(poolItem);
            }
            arrayList.clear();
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void postPoolItem(T T) {
        ArrayList<T> arrayList = this.mScheduledPoolItems;
        synchronized (arrayList) {
            if (T == null) {
                throw new IllegalArgumentException("PoolItem already recycled!");
            }
            if (!this.mPool.ownsPoolItem(T)) {
                throw new IllegalArgumentException("PoolItem from another pool!");
            }
            this.mScheduledPoolItems.add(T);
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void reset() {
        ArrayList<T> arrayList = this.mScheduledPoolItems;
        synchronized (arrayList) {
            int n = arrayList.size();
            Pool<PoolItem> pool = this.mPool;
            for (int i = n - 1; i >= 0; --i) {
                pool.recyclePoolItem((PoolItem)arrayList.get(i));
            }
            arrayList.clear();
            return;
        }
    }

}

