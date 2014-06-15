package org.anddev.andengine.util.pool;

public class EntityRemoveRunnablePoolUpdateHandler
  extends RunnablePoolUpdateHandler<EntityRemoveRunnablePoolItem>
{
  protected EntityRemoveRunnablePoolItem onAllocatePoolItem()
  {
    return new EntityRemoveRunnablePoolItem();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.EntityRemoveRunnablePoolUpdateHandler
 * JD-Core Version:    0.7.0.1
 */