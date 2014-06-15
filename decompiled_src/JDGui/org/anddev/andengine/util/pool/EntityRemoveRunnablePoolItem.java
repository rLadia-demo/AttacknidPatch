package org.anddev.andengine.util.pool;

import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;

public class EntityRemoveRunnablePoolItem
  extends RunnablePoolItem
{
  protected IEntity mEntity;
  protected ILayer mLayer;
  
  public void run()
  {
    this.mLayer.removeEntity(this.mEntity);
  }
  
  public void set(IEntity paramIEntity, ILayer paramILayer)
  {
    this.mEntity = paramIEntity;
    this.mLayer = paramILayer;
  }
  
  public void setEntity(IEntity paramIEntity)
  {
    this.mEntity = paramIEntity;
  }
  
  public void setLayer(ILayer paramILayer)
  {
    this.mLayer = paramILayer;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.pool.EntityRemoveRunnablePoolItem
 * JD-Core Version:    0.7.0.1
 */