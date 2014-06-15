package org.anddev.andengine.util.pool;

public abstract class PoolItem
{
    Pool<? extends PoolItem> mParent;
    boolean mRecycled;
    
    public PoolItem() {
        super();
        this.mRecycled = true;
    }
    
    public Pool<? extends PoolItem> getParent() {
        return this.mParent;
    }
    
    public boolean isFromPool(final Pool<? extends PoolItem> pool) {
        return pool == this.mParent;
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
