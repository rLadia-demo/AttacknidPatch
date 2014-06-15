package org.anddev.andengine.util.pool;

import java.util.Stack;
import org.anddev.andengine.util.Debug;

public abstract class GenericPool<T>
{
  private final Stack<T> mAvailableItems = new Stack();
  private final int mGrowth;
  private int mUnrecycledCount;
  
  public GenericPool()
  {
    this(0);
  }
  
  public GenericPool(int paramInt)
  {
    this(paramInt, 1);
  }
  
  public GenericPool(int paramInt1, int paramInt2)
  {
    if (paramInt2 < 0) {
      throw new IllegalArgumentException("pGrowth must be at least 0!");
    }
    this.mGrowth = paramInt2;
    if (paramInt1 > 0) {
      batchAllocatePoolItems(paramInt1);
    }
  }
  
  /* Error */
  public void batchAllocatePoolItems(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 26	org/anddev/andengine/util/pool/GenericPool:mAvailableItems	Ljava/util/Stack;
    //   6: astore_3
    //   7: iload_1
    //   8: iconst_1
    //   9: isub
    //   10: istore 4
    //   12: iload 4
    //   14: ifge +6 -> 20
    //   17: aload_0
    //   18: monitorexit
    //   19: return
    //   20: aload_3
    //   21: aload_0
    //   22: invokevirtual 42	org/anddev/andengine/util/pool/GenericPool:onHandleAllocatePoolItem	()Ljava/lang/Object;
    //   25: invokevirtual 46	java/util/Stack:push	(Ljava/lang/Object;)Ljava/lang/Object;
    //   28: pop
    //   29: iinc 4 255
    //   32: goto -20 -> 12
    //   35: astore_2
    //   36: aload_0
    //   37: monitorexit
    //   38: aload_2
    //   39: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	40	0	this	GenericPool
    //   0	40	1	paramInt	int
    //   35	4	2	localObject	Object
    //   6	15	3	localStack	Stack
    //   10	20	4	i	int
    // Exception table:
    //   from	to	target	type
    //   2	7	35	finally
    //   20	29	35	finally
  }
  
  public int getUnrecycledCount()
  {
    try
    {
      int i = this.mUnrecycledCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public T obtainPoolItem()
  {
    for (;;)
    {
      try
      {
        if (this.mAvailableItems.size() > 0)
        {
          localObject3 = this.mAvailableItems.pop();
          onHandleObtainItem(localObject3);
          this.mUnrecycledCount = (1 + this.mUnrecycledCount);
          return localObject3;
        }
        if (this.mGrowth == 1)
        {
          localObject3 = onHandleAllocatePoolItem();
          Debug.i(getClass().getName() + "<" + localObject3.getClass().getSimpleName() + "> was exhausted, with " + this.mUnrecycledCount + " item not yet recycled. Allocated " + this.mGrowth + " more.");
          continue;
        }
        batchAllocatePoolItems(this.mGrowth);
      }
      finally {}
      Object localObject2 = this.mAvailableItems.pop();
      Object localObject3 = localObject2;
    }
  }
  
  protected abstract T onAllocatePoolItem();
  
  protected T onHandleAllocatePoolItem()
  {
    return onAllocatePoolItem();
  }
  
  protected void onHandleObtainItem(T paramT) {}
  
  protected void onHandleRecycleItem(T paramT) {}
  
  public void recyclePoolItem(T paramT)
  {
    if (paramT == null) {
      try
      {
        throw new IllegalArgumentException("Cannot recycle null item!");
      }
      finally {}
    }
    onHandleRecycleItem(paramT);
    this.mAvailableItems.push(paramT);
    this.mUnrecycledCount = (-1 + this.mUnrecycledCount);
    if (this.mUnrecycledCount < 0) {
      Debug.e("More items recycled than obtained!");
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.GenericPool
 * JD-Core Version:    0.7.0.1
 */