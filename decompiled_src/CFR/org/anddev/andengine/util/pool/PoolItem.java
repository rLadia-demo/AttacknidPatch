/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import org.anddev.andengine.util.pool.Pool;

public abstract class PoolItem {
    Pool<? extends PoolItem> mParent;
    boolean mRecycled = true;

    public Pool<? extends PoolItem> getParent() {
        return this.mParent;
    }

    public boolean isFromPool(Pool<? extends PoolItem> pool) {
        if (pool != this.mParent) return false;
        return true;
    }

    public boolean isRecycled() {
        return this.mRecycled;
    }

    protected void onObtain() {
    }

    protected void onRecycle() {
    }

    public void recycle() {
        if (this.mParent == null) {
            throw new IllegalStateException("Item already recycled!");
        }
        this.mParent.recycle(this);
    }
}

