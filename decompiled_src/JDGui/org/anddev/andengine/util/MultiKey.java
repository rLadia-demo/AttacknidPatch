package org.anddev.andengine.util;

import java.util.Arrays;

public class MultiKey<K>
{
  private static final long serialVersionUID = 4465448607415788805L;
  private final int mCachedHashCode;
  private final K[] mKeys;
  
  public MultiKey(K... paramVarArgs)
  {
    this.mKeys = paramVarArgs;
    this.mCachedHashCode = hash(paramVarArgs);
  }
  
  public static int hash(Object... paramVarArgs)
  {
    int i = 0;
    int j = paramVarArgs.length;
    for (int k = 0;; k++)
    {
      if (k >= j) {
        return i;
      }
      Object localObject = paramVarArgs[k];
      if (localObject != null) {
        i ^= localObject.hashCode();
      }
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof MultiKey))
    {
      MultiKey localMultiKey = (MultiKey)paramObject;
      return Arrays.equals(this.mKeys, localMultiKey.mKeys);
    }
    return false;
  }
  
  public K getKey(int paramInt)
  {
    return this.mKeys[paramInt];
  }
  
  public K[] getKeys()
  {
    return this.mKeys;
  }
  
  public int hashCode()
  {
    return this.mCachedHashCode;
  }
  
  public int size()
  {
    return this.mKeys.length;
  }
  
  public String toString()
  {
    return "MultiKey" + Arrays.asList(this.mKeys).toString();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.MultiKey
 * JD-Core Version:    0.7.0.1
 */