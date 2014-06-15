package org.anddev.andengine.util.sort;

import java.util.Comparator;
import java.util.List;

public abstract class Sorter<T>
{
  public abstract void sort(List<T> paramList, int paramInt1, int paramInt2, Comparator<T> paramComparator);
  
  public final void sort(List<T> paramList, Comparator<T> paramComparator)
  {
    sort(paramList, 0, paramList.size(), paramComparator);
  }
  
  public abstract void sort(T[] paramArrayOfT, int paramInt1, int paramInt2, Comparator<T> paramComparator);
  
  public final void sort(T[] paramArrayOfT, Comparator<T> paramComparator)
  {
    sort(paramArrayOfT, 0, paramArrayOfT.length, paramComparator);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.sort.Sorter
 * JD-Core Version:    0.7.0.1
 */