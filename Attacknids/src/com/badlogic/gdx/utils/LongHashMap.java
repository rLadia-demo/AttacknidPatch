package com.badlogic.gdx.utils;

import java.util.Iterator;

public class LongHashMap<T>
{
  private int capacity;
  LongHashMap<T>.EntryIterable iterable = new EntryIterable();
  private float loadFactor;
  private int mask;
  private int size;
  private Entry[] table;
  private int threshold;
  
  public LongHashMap()
  {
    this(16, 0.75F);
  }
  
  public LongHashMap(int paramInt)
  {
    this(paramInt, 0.75F);
  }
  
  public LongHashMap(int paramInt, float paramFloat)
  {
    if (paramInt > 1073741824) {
      throw new IllegalArgumentException("initialCapacity is too large.");
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("initialCapacity must be greater than zero.");
    }
    if (paramFloat <= 0.0F) {
      throw new IllegalArgumentException("initialCapacity must be greater than zero.");
    }
    for (this.capacity = 1;; this.capacity <<= 1) {
      if (this.capacity >= paramInt)
      {
        this.loadFactor = paramFloat;
        this.threshold = ((int)(paramFloat * this.capacity));
        this.table = new Entry[this.capacity];
        this.mask = (-1 + this.capacity);
        return;
      }
    }
  }
  
  public void clear()
  {
    Entry[] arrayOfEntry = this.table;
    int i = arrayOfEntry.length;
    for (;;)
    {
      i--;
      if (i < 0)
      {
        this.size = 0;
        return;
      }
      arrayOfEntry[i] = null;
    }
  }
  
  public boolean containsKey(long paramLong)
  {
    int i = (int)paramLong & this.mask;
    for (Entry localEntry = this.table[i];; localEntry = localEntry.next)
    {
      if (localEntry == null) {
        return false;
      }
      if (localEntry.key == paramLong) {
        return true;
      }
    }
  }
  
  public boolean containsValue(Object paramObject)
  {
    Entry[] arrayOfEntry = this.table;
    int i = arrayOfEntry.length;
    int j = i - 1;
    if (i <= 0) {
      return false;
    }
    for (Entry localEntry = arrayOfEntry[j];; localEntry = localEntry.next)
    {
      if (localEntry == null)
      {
        i = j;
        break;
      }
      if (localEntry.value.equals(paramObject)) {
        return true;
      }
    }
  }
  
  public T get(long paramLong)
  {
    int i = (int)(paramLong & this.mask);
    for (Entry localEntry = this.table[i];; localEntry = localEntry.next)
    {
      if (localEntry == null) {
        return null;
      }
      if (localEntry.key == paramLong) {
        return localEntry.value;
      }
    }
  }
  
  public T put(long paramLong, T paramT)
  {
    int i = (int)(paramLong & this.mask);
    Entry localEntry1 = this.table[i];
    int k;
    Entry[] arrayOfEntry1;
    Entry[] arrayOfEntry2;
    int m;
    if (localEntry1 == null)
    {
      this.table[i] = new Entry(paramLong, paramT, this.table[i]);
      int j = this.size;
      this.size = (j + 1);
      if (j >= this.threshold)
      {
        k = 2 * this.capacity;
        arrayOfEntry1 = new Entry[k];
        arrayOfEntry2 = this.table;
        m = k - 1;
      }
    }
    for (int n = 0;; n++)
    {
      if (n >= arrayOfEntry2.length)
      {
        this.table = arrayOfEntry1;
        this.capacity = k;
        this.threshold = ((int)(k * this.loadFactor));
        this.mask = (-1 + this.capacity);
        return null;
        if (localEntry1.key != paramLong)
        {
          localEntry1 = localEntry1.next;
          break;
        }
        Object localObject1 = localEntry1.value;
        localEntry1.value = paramT;
        return localObject1;
      }
      Object localObject2 = arrayOfEntry2[n];
      if (localObject2 != null)
      {
        arrayOfEntry2[n] = null;
        do
        {
          Entry localEntry2 = ((Entry)localObject2).next;
          int i1 = (int)(((Entry)localObject2).key & m);
          ((Entry)localObject2).next = arrayOfEntry1[i1];
          arrayOfEntry1[i1] = localObject2;
          localObject2 = localEntry2;
        } while (localObject2 != null);
      }
    }
  }
  
  public T remove(long paramLong)
  {
    int i = (int)(paramLong & this.mask);
    Object localObject1 = this.table[i];
    Entry localEntry;
    for (Object localObject2 = localObject1;; localObject2 = localEntry)
    {
      if (localObject2 == null) {
        return null;
      }
      localEntry = localObject2.next;
      if (localObject2.key == paramLong)
      {
        this.size = (-1 + this.size);
        if (localObject1 == localObject2) {
          this.table[i] = localEntry;
        }
        for (;;)
        {
          return localObject2.value;
          ((Entry)localObject1).next = localEntry;
        }
      }
      localObject1 = localObject2;
    }
  }
  
  public int size()
  {
    return this.size;
  }
  
  public Iterable<T> values()
  {
    this.iterable.reset();
    return this.iterable;
  }
  
  static class Entry
  {
    final long key;
    Entry next;
    Object value;
    
    Entry(long paramLong, Object paramObject, Entry paramEntry)
    {
      this.key = paramLong;
      this.value = paramObject;
      this.next = paramEntry;
    }
  }
  
  class EntryIterable
    implements Iterable<T>
  {
    LongHashMap.Entry currEntry = null;
    int currIndex = -1;
    Iterator<T> iter = new Iterator()
    {
      private boolean loadNextEntry()
      {
        do
        {
          LongHashMap.EntryIterable localEntryIterable = LongHashMap.EntryIterable.this;
          localEntryIterable.currIndex = (1 + localEntryIterable.currIndex);
          if (LongHashMap.EntryIterable.this.currIndex >= LongHashMap.this.table.length) {
            return false;
          }
        } while (LongHashMap.this.table[LongHashMap.EntryIterable.this.currIndex] == null);
        LongHashMap.EntryIterable.this.currEntry = LongHashMap.this.table[LongHashMap.EntryIterable.this.currIndex];
        return true;
      }
      
      public boolean hasNext()
      {
        if (LongHashMap.EntryIterable.this.currEntry == null)
        {
          if (loadNextEntry()) {}
        }
        else {
          do
          {
            return false;
            if (LongHashMap.EntryIterable.this.currEntry.next != null) {
              break;
            }
          } while (!loadNextEntry());
        }
        for (;;)
        {
          return true;
          LongHashMap.EntryIterable.this.currEntry = LongHashMap.EntryIterable.this.currEntry.next;
        }
      }
      
      public T next()
      {
        return LongHashMap.EntryIterable.this.currEntry.value;
      }
      
      public void remove()
      {
        throw new UnsupportedOperationException("not implemented");
      }
    };
    
    EntryIterable() {}
    
    public Iterator<T> iterator()
    {
      return this.iter;
    }
    
    public void reset()
    {
      this.currIndex = -1;
      this.currEntry = null;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.utils.LongHashMap
 * JD-Core Version:    0.7.0.1
 */