/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import org.anddev.andengine.util.pool.GenericPool;
import org.anddev.andengine.util.pool.PoolItem;

public abstract class Pool<T extends PoolItem>
extends GenericPool<T> {
    public Pool() {
    }

    public Pool(int n) {
        super(n);
    }

    public Pool(int n, int n2) {
        super(n, n2);
    }

    @Override
    protected T onHandleAllocatePoolItem() {
        PoolItem poolItem = (PoolItem)super.onHandleAllocatePoolItem();
        poolItem.mParent = this;
        return poolItem;
    }

    @Override
    protected void onHandleObtainItem(T T) {
        T.mRecycled = false;
        T.onObtain();
    }

    @Override
    protected void onHandleRecycleItem(T T) {
        T.onRecycle();
        T.mRecycled = true;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public boolean ownsPoolItem(T T) {
        synchronized (this) {
            Pool<? extends PoolItem> pool = T.mParent;
            if (pool != this) return false;
            return true;
        }
    }

    void recycle(PoolItem poolItem) {
        this.recyclePoolItem((T)poolItem);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void recyclePoolItem(T T) {
        synchronized (this) {
            if (T.mParent == null) {
                throw new IllegalArgumentException("PoolItem not assigned to a pool!");
            }
            if (!T.isFromPool(this)) {
                throw new IllegalArgumentException("PoolItem from another pool!");
            }
            if (T.isRecycled()) {
                throw new IllegalArgumentException("PoolItem already recycled!");
            }
            super.recyclePoolItem(T);
            return;
        }
    }
}

