/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.SparseArray
 */
package org.anddev.andengine.util;

import android.util.SparseArray;

public class Library<T> {
    protected final SparseArray<T> mItems;

    public Library() {
        this.mItems = new SparseArray();
    }

    public Library(int n) {
        this.mItems = new SparseArray(n);
    }

    public T get(int n) {
        return this.mItems.get(n);
    }

    public void put(int n, T T) {
        Object object = this.mItems.get(n);
        if (object != null) throw new IllegalArgumentException("ID: '" + n + "' is already associated with item: '" + object.toString() + "'.");
        this.mItems.put(n, T);
    }

    public void remove(int n) {
        this.mItems.remove(n);
    }
}

