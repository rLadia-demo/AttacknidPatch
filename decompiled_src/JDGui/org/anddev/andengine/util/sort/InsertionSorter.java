package org.anddev.andengine.util.sort;

import java.util.Comparator;
import java.util.List;

public class InsertionSorter<T>
  extends Sorter<T>
{
  public void sort(List<T> paramList, int paramInt1, int paramInt2, Comparator<T> paramComparator)
  {
    int i = paramInt1 + 1;
    if (i >= paramInt2) {
      return;
    }
    Object localObject1 = paramList.get(i);
    Object localObject2 = paramList.get(i - 1);
    if (paramComparator.compare(localObject1, localObject2) < 0) {}
    int k;
    for (int j = i;; j = k)
    {
      k = j - 1;
      paramList.set(j, localObject2);
      if (k > paramInt1)
      {
        localObject2 = paramList.get(k - 1);
        if (paramComparator.compare(localObject1, localObject2) < 0) {}
      }
      else
      {
        paramList.set(k, localObject1);
        i++;
        break;
      }
    }
  }
  
  public void sort(T[] paramArrayOfT, int paramInt1, int paramInt2, Comparator<T> paramComparator)
  {
    int i = paramInt1 + 1;
    if (i >= paramInt2) {
      return;
    }
    T ? = paramArrayOfT[i];
    T ? = paramArrayOfT[(i - 1)];
    if (paramComparator.compare(?, ?) < 0) {}
    int k;
    for (int j = i;; j = k)
    {
      k = j - 1;
      paramArrayOfT[j] = ?;
      if (k > paramInt1)
      {
        ? = paramArrayOfT[(k - 1)];
        if (paramComparator.compare(?, ?) < 0) {}
      }
      else
      {
        paramArrayOfT[k] = ?;
        i++;
        break;
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.sort.InsertionSorter
 * JD-Core Version:    0.7.0.1
 */