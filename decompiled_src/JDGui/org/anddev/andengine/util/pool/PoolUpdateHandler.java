package org.anddev.andengine.util.pool;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;

public abstract class PoolUpdateHandler<T extends PoolItem>
  implements IUpdateHandler
{
  private final Pool<T> mPool;
  private final ArrayList<T> mScheduledPoolItems = new ArrayList();
  
  public PoolUpdateHandler()
  {
    this.mPool = new Pool()
    {
      protected T onAllocatePoolItem()
      {
        return PoolUpdateHandler.this.onAllocatePoolItem();
      }
    };
  }
  
  public PoolUpdateHandler(int paramInt)
  {
    this.mPool = new Pool(paramInt)
    {
      protected T onAllocatePoolItem()
      {
        return PoolUpdateHandler.this.onAllocatePoolItem();
      }
    };
  }
  
  public PoolUpdateHandler(int paramInt1, int paramInt2)
  {
    this.mPool = new Pool(paramInt1, paramInt2)
    {
      protected T onAllocatePoolItem()
      {
        return PoolUpdateHandler.this.onAllocatePoolItem();
      }
    };
  }
  
  public T obtainPoolItem()
  {
    return (PoolItem)this.mPool.obtainPoolItem();
  }
  
  protected abstract T onAllocatePoolItem();
  
  protected abstract void onHandlePoolItem(T paramT);
  
  public void onUpdate(float paramFloat)
  {
    synchronized (this.mScheduledPoolItems)
    {
      int i = ???.size();
      Pool localPool;
      int j;
      if (i > 0)
      {
        localPool = this.mPool;
        j = 0;
        if (j >= i) {
          ???.clear();
        }
      }
      else
      {
        return;
      }
      PoolItem localPoolItem = (PoolItem)???.get(j);
      onHandlePoolItem(localPoolItem);
      localPool.recyclePoolItem(localPoolItem);
      j++;
    }
  }
  
  public void postPoolItem(T paramT)
  {
    ArrayList localArrayList = this.mScheduledPoolItems;
    if (paramT == null) {
      try
      {
        throw new IllegalArgumentException("PoolItem already recycled!");
      }
      finally {}
    }
    if (!this.mPool.ownsPoolItem(paramT)) {
      throw new IllegalArgumentException("PoolItem from another pool!");
    }
    this.mScheduledPoolItems.add(paramT);
  }
  
  public void reset()
  {
    synchronized (this.mScheduledPoolItems)
    {
      int i = ???.size();
      Pool localPool = this.mPool;
      int j = i - 1;
      if (j < 0)
      {
        ???.clear();
        return;
      }
      localPool.recyclePoolItem((PoolItem)???.get(j));
      j--;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.PoolUpdateHandler
 * JD-Core Version:    0.7.0.1
 */