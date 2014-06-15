package org.anddev.andengine.util.pool;

public abstract class PoolItem
{
  Pool<? extends PoolItem> mParent;
  boolean mRecycled = true;
  
  public Pool<? extends PoolItem> getParent()
  {
    return this.mParent;
  }
  
  public boolean isFromPool(Pool<? extends PoolItem> paramPool)
  {
    return paramPool == this.mParent;
  }
  
  public boolean isRecycled()
  {
    return this.mRecycled;
  }
  
  protected void onObtain() {}
  
  protected void onRecycle() {}
  
  public void recycle()
  {
    if (this.mParent == null) {
      throw new IllegalStateException("Item already recycled!");
    }
    this.mParent.recycle(this);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.PoolItem
 * JD-Core Version:    0.7.0.1
 */