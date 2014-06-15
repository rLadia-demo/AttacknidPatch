/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.util.ArrayList;

public class ListUtils {
    public static <T> ArrayList<? extends T> toList(T T) {
        ArrayList<T> arrayList = new ArrayList<T>();
        arrayList.add(T);
        return arrayList;
    }
}

