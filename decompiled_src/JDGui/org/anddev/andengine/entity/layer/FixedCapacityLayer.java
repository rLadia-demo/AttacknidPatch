package org.anddev.andengine.entity.layer;

import java.util.Comparator;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.util.IEntityMatcher;

public class FixedCapacityLayer
  extends BaseLayer
{
  private final int mCapacity;
  private final IEntity[] mEntities;
  private int mEntityCount;
  
  public FixedCapacityLayer(int paramInt)
  {
    this.mCapacity = paramInt;
    this.mEntities = new IEntity[paramInt];
    this.mEntityCount = 0;
  }
  
  private void checkIndex(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= this.mEntityCount)) {
      throw new IndexOutOfBoundsException("Invalid index: " + paramInt + " (Size: " + this.mEntityCount + " | Capacity: " + this.mCapacity + ")");
    }
  }
  
  private int indexOfEntity(IEntity paramIEntity)
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    for (int i = -1 + arrayOfIEntity.length;; i--)
    {
      if (i < 0) {
        i = -1;
      }
      while (arrayOfIEntity[i] == paramIEntity) {
        return i;
      }
    }
  }
  
  public void addEntity(IEntity paramIEntity)
  {
    if (this.mEntityCount < this.mCapacity)
    {
      this.mEntities[this.mEntityCount] = paramIEntity;
      this.mEntityCount = (1 + this.mEntityCount);
    }
  }
  
  public void clear()
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    for (int i = -1 + this.mEntityCount;; i--)
    {
      if (i < 0)
      {
        this.mEntityCount = 0;
        return;
      }
      arrayOfIEntity[i] = null;
    }
  }
  
  public IEntity findEntity(IEntityMatcher paramIEntityMatcher)
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    for (int i = -1 + arrayOfIEntity.length;; i--)
    {
      IEntity localIEntity;
      if (i < 0) {
        localIEntity = null;
      }
      do
      {
        return localIEntity;
        localIEntity = arrayOfIEntity[i];
      } while (paramIEntityMatcher.matches(localIEntity));
    }
  }
  
  public IEntity getEntity(int paramInt)
  {
    checkIndex(paramInt);
    return this.mEntities[paramInt];
  }
  
  public int getEntityCount()
  {
    return this.mEntityCount;
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    int i = this.mEntityCount;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      arrayOfIEntity[j].onDraw(paramGL10, paramCamera);
    }
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    int i = this.mEntityCount;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      arrayOfIEntity[j].onUpdate(paramFloat);
    }
  }
  
  public IEntity removeEntity(int paramInt)
  {
    checkIndex(paramInt);
    IEntity[] arrayOfIEntity = this.mEntities;
    IEntity localIEntity = arrayOfIEntity[paramInt];
    int i = -1 + this.mEntityCount;
    if (paramInt == i) {
      this.mEntities[i] = null;
    }
    for (;;)
    {
      this.mEntityCount = i;
      return localIEntity;
      arrayOfIEntity[paramInt] = arrayOfIEntity[i];
      arrayOfIEntity[this.mEntityCount] = null;
    }
  }
  
  public boolean removeEntity(IEntity paramIEntity)
  {
    return removeEntity(indexOfEntity(paramIEntity)) != null;
  }
  
  public boolean removeEntity(IEntityMatcher paramIEntityMatcher)
  {
    IEntity[] arrayOfIEntity = this.mEntities;
    for (int i = -1 + arrayOfIEntity.length;; i--)
    {
      if (i < 0) {
        return false;
      }
      if (paramIEntityMatcher.matches(arrayOfIEntity[i]))
      {
        removeEntity(i);
        return true;
      }
    }
  }
  
  public IEntity replaceEntity(int paramInt, IEntity paramIEntity)
  {
    checkIndex(paramInt);
    IEntity[] arrayOfIEntity = this.mEntities;
    IEntity localIEntity = arrayOfIEntity[paramInt];
    arrayOfIEntity[paramInt] = paramIEntity;
    return localIEntity;
  }
  
  public void reset()
  {
    super.reset();
    IEntity[] arrayOfIEntity = this.mEntities;
    for (int i = -1 + this.mEntityCount;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfIEntity[i].reset();
    }
  }
  
  public void setEntity(int paramInt, IEntity paramIEntity)
  {
    checkIndex(paramInt);
    if (paramInt == this.mEntityCount) {
      addEntity(paramIEntity);
    }
    while (paramInt >= this.mEntityCount) {
      return;
    }
    this.mEntities[paramInt] = paramIEntity;
  }
  
  public void sortEntities()
  {
    ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount);
  }
  
  public void sortEntities(Comparator<IEntity> paramComparator)
  {
    ZIndexSorter.getInstance().sort(this.mEntities, 0, this.mEntityCount, paramComparator);
  }
  
  public void swapEntities(int paramInt1, int paramInt2)
  {
    if (paramInt1 > this.mEntityCount) {
      throw new IndexOutOfBoundsException("pEntityIndexA was bigger than the EntityCount.");
    }
    if (paramInt1 > this.mEntityCount) {
      throw new IndexOutOfBoundsException("pEntityIndexB was bigger than the EntityCount.");
    }
    IEntity[] arrayOfIEntity = this.mEntities;
    IEntity localIEntity = arrayOfIEntity[paramInt1];
    arrayOfIEntity[paramInt1] = arrayOfIEntity[paramInt2];
    arrayOfIEntity[paramInt2] = localIEntity;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.FixedCapacityLayer
 * JD-Core Version:    0.7.0.1
 */