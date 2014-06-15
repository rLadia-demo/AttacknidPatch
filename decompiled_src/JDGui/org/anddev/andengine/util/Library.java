package org.anddev.andengine.util;

import android.util.SparseArray;

public class Library<T>
{
  protected final SparseArray<T> mItems;
  
  public Library()
  {
    this.mItems = new SparseArray();
  }
  
  public Library(int paramInt)
  {
    this.mItems = new SparseArray(paramInt);
  }
  
  public T get(int paramInt)
  {
    return this.mItems.get(paramInt);
  }
  
  public void put(int paramInt, T paramT)
  {
    Object localObject = this.mItems.get(paramInt);
    if (localObject == null)
    {
      this.mItems.put(paramInt, paramT);
      return;
    }
    throw new IllegalArgumentException("ID: '" + paramInt + "' is already associated with item: '" + localObject.toString() + "'.");
  }
  
  public void remove(int paramInt)
  {
    this.mItems.remove(paramInt);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.Library
 * JD-Core Version:    0.7.0.1
 */