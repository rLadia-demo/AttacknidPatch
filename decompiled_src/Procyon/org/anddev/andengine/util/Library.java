package org.anddev.andengine.util;

import android.util.*;

public class Library<T>
{
    protected final SparseArray<T> mItems;
    
    public Library() {
        super();
        this.mItems = (SparseArray<T>)new SparseArray();
    }
    
    public Library(final int n) {
        super();
        this.mItems = (SparseArray<T>)new SparseArray(n);
    }
    
    public T get(final int n) {
        return (T)this.mItems.get(n);
    }
    
    public void put(final int n, final T t) {
        final Object value = this.mItems.get(n);
        if (value == null) {
            this.mItems.put(n, (Object)t);
            return;
        }
        throw new IllegalArgumentException("ID: '" + n + "' is already associated with item: '" + value.toString() + "'.");
    }
    
    public void remove(final int n) {
        this.mItems.remove(n);
    }
}
