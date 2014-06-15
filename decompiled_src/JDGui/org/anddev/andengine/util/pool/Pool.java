package org.anddev.andengine.util.pool;

public abstract class Pool<T extends PoolItem>
  extends GenericPool<T>
{
  public Pool() {}
  
  public Pool(int paramInt)
  {
    super(paramInt);
  }
  
  public Pool(int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2);
  }
  
  protected T onHandleAllocatePoolItem()
  {
    PoolItem localPoolItem = (PoolItem)super.onHandleAllocatePoolItem();
    localPoolItem.mParent = this;
    return localPoolItem;
  }
  
  protected void onHandleObtainItem(T paramT)
  {
    paramT.mRecycled = false;
    paramT.onObtain();
  }
  
  protected void onHandleRecycleItem(T paramT)
  {
    paramT.onRecycle();
    paramT.mRecycled = true;
  }
  
  /* Error */
  public boolean ownsPoolItem(T paramT)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: getfield 28	org/anddev/andengine/util/pool/PoolItem:mParent	Lorg/anddev/andengine/util/pool/Pool;
    //   6: astore_3
    //   7: aload_3
    //   8: aload_0
    //   9: if_acmpne +11 -> 20
    //   12: iconst_1
    //   13: istore 4
    //   15: aload_0
    //   16: monitorexit
    //   17: iload 4
    //   19: ireturn
    //   20: iconst_0
    //   21: istore 4
    //   23: goto -8 -> 15
    //   26: astore_2
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_2
    //   30: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	31	0	this	Pool
    //   0	31	1	paramT	T
    //   26	4	2	localObject	Object
    //   6	2	3	localPool	Pool
    //   13	9	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	7	26	finally
  }
  
  void recycle(PoolItem paramPoolItem)
  {
    recyclePoolItem(paramPoolItem);
  }
  
  public void recyclePoolItem(T paramT)
  {
    try
    {
      if (paramT.mParent == null) {
        throw new IllegalArgumentException("PoolItem not assigned to a pool!");
      }
    }
    finally {}
    if (!paramT.isFromPool(this)) {
      throw new IllegalArgumentException("PoolItem from another pool!");
    }
    if (paramT.isRecycled()) {
      throw new IllegalArgumentException("PoolItem already recycled!");
    }
    super.recyclePoolItem(paramT);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.Pool
 * JD-Core Version:    0.7.0.1
 */