package org.anddev.andengine.entity.layer;

import java.util.ArrayList;
import java.util.Comparator;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.util.IEntityMatcher;

public class DynamicCapacityLayer
  extends BaseLayer
{
  private static final int CAPACITY_DEFAULT = 10;
  private final ArrayList<IEntity> mEntities;
  
  public DynamicCapacityLayer()
  {
    this(10);
  }
  
  public DynamicCapacityLayer(int paramInt)
  {
    this.mEntities = new ArrayList(paramInt);
  }
  
  public void addEntity(IEntity paramIEntity)
  {
    this.mEntities.add(paramIEntity);
  }
  
  public void clear()
  {
    this.mEntities.clear();
  }
  
  public IEntity findEntity(IEntityMatcher paramIEntityMatcher)
  {
    ArrayList localArrayList = this.mEntities;
    for (int i = -1 + localArrayList.size();; i--)
    {
      IEntity localIEntity;
      if (i < 0) {
        localIEntity = null;
      }
      do
      {
        return localIEntity;
        localIEntity = (IEntity)localArrayList.get(i);
      } while (paramIEntityMatcher.matches(localIEntity));
    }
  }
  
  public IEntity getEntity(int paramInt)
  {
    return (IEntity)this.mEntities.get(paramInt);
  }
  
  public int getEntityCount()
  {
    return this.mEntities.size();
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    ArrayList localArrayList = this.mEntities;
    int i = localArrayList.size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      ((IEntity)localArrayList.get(j)).onDraw(paramGL10, paramCamera);
    }
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    ArrayList localArrayList = this.mEntities;
    int i = localArrayList.size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      ((IEntity)localArrayList.get(j)).onUpdate(paramFloat);
    }
  }
  
  public IEntity removeEntity(int paramInt)
  {
    return (IEntity)this.mEntities.remove(paramInt);
  }
  
  public boolean removeEntity(IEntity paramIEntity)
  {
    return this.mEntities.remove(paramIEntity);
  }
  
  public boolean removeEntity(IEntityMatcher paramIEntityMatcher)
  {
    ArrayList localArrayList = this.mEntities;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return false;
      }
      if (paramIEntityMatcher.matches((IEntity)localArrayList.get(i)))
      {
        localArrayList.remove(i);
        return true;
      }
    }
  }
  
  public IEntity replaceEntity(int paramInt, IEntity paramIEntity)
  {
    return (IEntity)this.mEntities.set(paramInt, paramIEntity);
  }
  
  public void reset()
  {
    super.reset();
    ArrayList localArrayList = this.mEntities;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((IEntity)localArrayList.get(i)).reset();
    }
  }
  
  public void setEntity(int paramInt, IEntity paramIEntity)
  {
    if (paramInt == this.mEntities.size())
    {
      addEntity(paramIEntity);
      return;
    }
    this.mEntities.set(paramInt, paramIEntity);
  }
  
  public void sortEntities()
  {
    ZIndexSorter.getInstance().sort(this.mEntities);
  }
  
  public void sortEntities(Comparator<IEntity> paramComparator)
  {
    ZIndexSorter.getInstance().sort(this.mEntities, paramComparator);
  }
  
  public void swapEntities(int paramInt1, int paramInt2)
  {
    ArrayList localArrayList = this.mEntities;
    localArrayList.set(paramInt1, (IEntity)localArrayList.set(paramInt2, (IEntity)localArrayList.get(paramInt1)));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.DynamicCapacityLayer
 * JD-Core Version:    0.7.0.1
 */