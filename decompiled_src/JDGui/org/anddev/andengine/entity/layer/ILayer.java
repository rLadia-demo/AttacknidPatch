package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import java.util.Comparator;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.scene.Scene.ITouchArea;
import org.anddev.andengine.util.IEntityMatcher;

public abstract interface ILayer
  extends IEntity
{
  public abstract void addEntity(IEntity paramIEntity);
  
  public abstract void clear();
  
  public abstract IEntity findEntity(IEntityMatcher paramIEntityMatcher);
  
  public abstract IEntity getEntity(int paramInt);
  
  public abstract int getEntityCount();
  
  public abstract ArrayList<Scene.ITouchArea> getTouchAreas();
  
  public abstract void registerTouchArea(Scene.ITouchArea paramITouchArea);
  
  public abstract IEntity removeEntity(int paramInt);
  
  public abstract boolean removeEntity(IEntity paramIEntity);
  
  public abstract boolean removeEntity(IEntityMatcher paramIEntityMatcher);
  
  public abstract IEntity replaceEntity(int paramInt, IEntity paramIEntity);
  
  public abstract void setEntity(int paramInt, IEntity paramIEntity);
  
  public abstract void sortEntities();
  
  public abstract void sortEntities(Comparator<IEntity> paramComparator);
  
  public abstract void swapEntities(int paramInt1, int paramInt2);
  
  public abstract void unregisterTouchArea(Scene.ITouchArea paramITouchArea);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.ILayer
 * JD-Core Version:    0.7.0.1
 */