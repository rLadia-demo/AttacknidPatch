package org.anddev.andengine.entity.layer;

import java.util.Comparator;
import java.util.List;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.util.sort.InsertionSorter;

public class ZIndexSorter
  extends InsertionSorter<IEntity>
{
  private static ZIndexSorter INSTANCE;
  private final Comparator<IEntity> mZIndexComparator = new Comparator()
  {
    public int compare(IEntity paramAnonymousIEntity1, IEntity paramAnonymousIEntity2)
    {
      return paramAnonymousIEntity1.getZIndex() - paramAnonymousIEntity2.getZIndex();
    }
  };
  
  public static ZIndexSorter getInstance()
  {
    if (INSTANCE == null) {
      INSTANCE = new ZIndexSorter();
    }
    return INSTANCE;
  }
  
  public void sort(List<IEntity> paramList)
  {
    sort(paramList, this.mZIndexComparator);
  }
  
  public void sort(List<IEntity> paramList, int paramInt1, int paramInt2)
  {
    sort(paramList, paramInt1, paramInt2, this.mZIndexComparator);
  }
  
  public void sort(IEntity[] paramArrayOfIEntity)
  {
    sort(paramArrayOfIEntity, this.mZIndexComparator);
  }
  
  public void sort(IEntity[] paramArrayOfIEntity, int paramInt1, int paramInt2)
  {
    sort(paramArrayOfIEntity, paramInt1, paramInt2, this.mZIndexComparator);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.ZIndexSorter
 * JD-Core Version:    0.7.0.1
 */