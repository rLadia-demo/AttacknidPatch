package org.anddev.andengine.util.sort;

import java.util.*;

public abstract class Sorter<T>
{
    public abstract void sort(final List<T> p0, final int p1, final int p2, final Comparator<T> p3);
    
    public final void sort(final List<T> list, final Comparator<T> comparator) {
        this.sort(list, 0, list.size(), comparator);
    }
    
    public abstract void sort(final T[] p0, final int p1, final int p2, final Comparator<T> p3);
    
    public final void sort(final T[] array, final Comparator<T> comparator) {
        this.sort(array, 0, array.length, comparator);
    }
}
