package org.anddev.andengine.util.pool;

public abstract class Pool<T extends PoolItem> extends GenericPool<T>
{
    public Pool() {
        super();
    }
    
    public Pool(final int n) {
        super(n);
    }
    
    public Pool(final int n, final int n2) {
        super(n, n2);
    }
    
    @Override
    protected T onHandleAllocatePoolItem() {
        final PoolItem poolItem = super.onHandleAllocatePoolItem();
        poolItem.mParent = this;
        return (T)poolItem;
    }
    
    @Override
    protected void onHandleObtainItem(final T t) {
        t.mRecycled = false;
        t.onObtain();
    }
    
    @Override
    protected void onHandleRecycleItem(final T t) {
        t.onRecycle();
        t.mRecycled = true;
    }
    
    public boolean ownsPoolItem(final T t) {
        synchronized (this) {
            return t.mParent == this;
        }
    }
    
    void recycle(final PoolItem poolItem) {
        this.recyclePoolItem(poolItem);
    }
    
    @Override
    public void recyclePoolItem(final T t) {
        synchronized (this) {
            if (t.mParent == null) {
                throw new IllegalArgumentException("PoolItem not assigned to a pool!");
            }
        }
        if (!t.isFromPool(this)) {
            throw new IllegalArgumentException("PoolItem from another pool!");
        }
        if (t.isRecycled()) {
            throw new IllegalArgumentException("PoolItem already recycled!");
        }
        super.recyclePoolItem(t);
        // monitorexit(this)
    }
    // monitorexit(this)
}
