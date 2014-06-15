package org.anddev.andengine.util.pool;

import java.util.*;
import org.anddev.andengine.util.*;

public abstract class GenericPool<T>
{
    private final Stack<T> mAvailableItems;
    private final int mGrowth;
    private int mUnrecycledCount;
    
    public GenericPool() {
        this(0);
    }
    
    public GenericPool(final int n) {
        this(n, 1);
    }
    
    public GenericPool(final int n, final int mGrowth) {
        super();
        this.mAvailableItems = new Stack<T>();
        if (mGrowth < 0) {
            throw new IllegalArgumentException("pGrowth must be at least 0!");
        }
        this.mGrowth = mGrowth;
        if (n > 0) {
            this.batchAllocatePoolItems(n);
        }
    }
    
    public void batchAllocatePoolItems(final int n) {
        synchronized (this) {
            final Stack<T> mAvailableItems = this.mAvailableItems;
            for (int i = n - 1; i >= 0; --i) {
                mAvailableItems.push(this.onHandleAllocatePoolItem());
            }
        }
    }
    
    public int getUnrecycledCount() {
        synchronized (this) {
            return this.mUnrecycledCount;
        }
    }
    
    public T obtainPoolItem() {
        while (true) {
            while (true) {
                Label_0127: {
                    synchronized (this) {
                        T t;
                        if (this.mAvailableItems.size() > 0) {
                            t = this.mAvailableItems.pop();
                        }
                        else {
                            if (this.mGrowth != 1) {
                                break Label_0127;
                            }
                            t = this.onHandleAllocatePoolItem();
                            Debug.i(String.valueOf(this.getClass().getName()) + "<" + t.getClass().getSimpleName() + "> was exhausted, with " + this.mUnrecycledCount + " item not yet recycled. Allocated " + this.mGrowth + " more.");
                        }
                        this.onHandleObtainItem(t);
                        ++this.mUnrecycledCount;
                        return t;
                    }
                }
                this.batchAllocatePoolItems(this.mGrowth);
                T t = this.mAvailableItems.pop();
                continue;
            }
        }
    }
    
    protected abstract T onAllocatePoolItem();
    
    protected T onHandleAllocatePoolItem() {
        return this.onAllocatePoolItem();
    }
    
    protected void onHandleObtainItem(final T t) {
    }
    
    protected void onHandleRecycleItem(final T t) {
    }
    
    public void recyclePoolItem(final T t) {
        // monitorenter(this)
        // monitorenter(this)
        if (t == null) {
            try {
                throw new IllegalArgumentException("Cannot recycle null item!");
            }
            finally {
            }
            // monitorexit(this)
        }
        this.onHandleRecycleItem(t);
        this.mAvailableItems.push(t);
        --this.mUnrecycledCount;
        if (this.mUnrecycledCount < 0) {
            Debug.e("More items recycled than obtained!");
        }
        // monitorexit(this)
    }
    // monitorexit(this)
}
