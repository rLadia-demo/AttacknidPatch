package org.anddev.andengine.util.sort;

import java.util.*;

public class InsertionSorter<T> extends Sorter<T>
{
    @Override
    public void sort(final List<T> list, final int n, final int n2, final Comparator<T> comparator) {
        for (int i = n + 1; i < n2; ++i) {
            final T value = list.get(i);
            T t = list.get(i - 1);
            if (comparator.compare(value, t) < 0) {
                int n3 = i;
                int n4;
                while (true) {
                    n4 = n3 - 1;
                    list.set(n3, t);
                    if (n4 <= n) {
                        break;
                    }
                    t = list.get(n4 - 1);
                    if (comparator.compare(value, t) >= 0) {
                        break;
                    }
                    n3 = n4;
                }
                list.set(n4, value);
            }
        }
    }
    
    @Override
    public void sort(final T[] array, final int n, final int n2, final Comparator<T> comparator) {
        for (int i = n + 1; i < n2; ++i) {
            final T t = array[i];
            T t2 = array[i - 1];
            if (comparator.compare(t, t2) < 0) {
                int n3 = i;
                int n4;
                while (true) {
                    n4 = n3 - 1;
                    array[n3] = t2;
                    if (n4 <= n) {
                        break;
                    }
                    t2 = array[n4 - 1];
                    if (comparator.compare(t, t2) >= 0) {
                        break;
                    }
                    n3 = n4;
                }
                array[n4] = t;
            }
        }
    }
}
