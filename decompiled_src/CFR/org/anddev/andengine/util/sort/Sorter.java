/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util.sort;

import java.util.Comparator;
import java.util.List;

public abstract class Sorter<T> {
    public abstract void sort(List<T> var1, int var2, int var3, Comparator<T> var4);

    public final void sort(List<T> list, Comparator<T> comparator) {
        this.sort(list, 0, list.size(), comparator);
    }

    public abstract void sort(T[] var1, int var2, int var3, Comparator<T> var4);

    public final void sort(T[] arrT, Comparator<T> comparator) {
        this.sort(arrT, 0, arrT.length, comparator);
    }
}

