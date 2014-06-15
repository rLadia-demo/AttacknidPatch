/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.pool;

import java.util.Stack;
import org.anddev.andengine.util.Debug;

public abstract class GenericPool<T> {
    private final Stack<T> mAvailableItems = new Stack<T>();
    private final int mGrowth;
    private int mUnrecycledCount;

    public GenericPool() {
        this(0);
    }

    public GenericPool(int n) {
        this(n, 1);
    }

    public GenericPool(int n, int n2) {
        if (n2 < 0) {
            throw new IllegalArgumentException("pGrowth must be at least 0!");
        }
        this.mGrowth = n2;
        if (n <= 0) return;
        this.batchAllocatePoolItems(n);
    }

    public void batchAllocatePoolItems(int n) {
        synchronized (this) {
            Stack<T> stack = this.mAvailableItems;
            int n2 = n - 1;
            do {
                if (n2 < 0) {
                    return;
                }
                stack.push(this.onHandleAllocatePoolItem());
                --n2;
            } while (true);
        }
    }

    public int getUnrecycledCount() {
        synchronized (this) {
            int n = this.mUnrecycledCount;
            return n;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public T obtainPoolItem() {
        synchronized (this) {
            T T;
            if (this.mAvailableItems.size() > 0) {
                T = this.mAvailableItems.pop();
            } else {
                if (this.mGrowth == 1) {
                    T = this.onHandleAllocatePoolItem();
                } else {
                    T T2;
                    this.batchAllocatePoolItems(this.mGrowth);
                    T = T2 = this.mAvailableItems.pop();
                }
                Debug.i(String.valueOf(this.getClass().getName()) + "<" + T.getClass().getSimpleName() + "> was exhausted, with " + this.mUnrecycledCount + " item not yet recycled. Allocated " + this.mGrowth + " more.");
            }
            this.onHandleObtainItem(T);
            this.mUnrecycledCount = 1 + this.mUnrecycledCount;
            return T;
        }
    }

    protected abstract T onAllocatePoolItem();

    protected T onHandleAllocatePoolItem() {
        return this.onAllocatePoolItem();
    }

    protected void onHandleObtainItem(T T) {
    }

    protected void onHandleRecycleItem(T T) {
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void recyclePoolItem(T T) {
        synchronized (this) {
            if (T == null) {
                throw new IllegalArgumentException("Cannot recycle null item!");
            }
            this.onHandleRecycleItem(T);
            this.mAvailableItems.push(T);
            this.mUnrecycledCount = -1 + this.mUnrecycledCount;
            if (this.mUnrecycledCount >= 0) return;
            Debug.e("More items recycled than obtained!");
            return;
        }
    }
}

