package org.anddev.andengine.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class MultiKeyHashMap<K, V>
  extends HashMap<MultiKey<K>, V>
{
  private static final long serialVersionUID = -6262447639526561122L;
  
  private boolean isEqualKey(K[] paramArrayOfK1, K[] paramArrayOfK2)
  {
    if (paramArrayOfK1.length != paramArrayOfK2.length) {}
    int i;
    K ?;
    K ?;
    do
    {
      return false;
      i = 0;
      if (i >= paramArrayOfK1.length) {
        return true;
      }
      ? = paramArrayOfK1[i];
      ? = paramArrayOfK2[i];
      if (? != null) {
        break;
      }
    } while (? != null);
    while (?.equals(?))
    {
      i++;
      break;
    }
    return false;
  }
  
  public V get(K... paramVarArgs)
  {
    int i = MultiKey.hash(paramVarArgs);
    Iterator localIterator = entrySet().iterator();
    Map.Entry localEntry;
    MultiKey localMultiKey;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localEntry = (Map.Entry)localIterator.next();
      localMultiKey = (MultiKey)localEntry.getKey();
    } while ((localMultiKey.hashCode() != i) || (!isEqualKey(localMultiKey.getKeys(), paramVarArgs)));
    return localEntry.getValue();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.MultiKeyHashMap
 * JD-Core Version:    0.7.0.1
 */