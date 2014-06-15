package org.anddev.andengine.util;

import java.util.*;

public class ListUtils
{
    public static <T> ArrayList<? extends T> toList(final T t) {
        final ArrayList<T> list = new ArrayList<T>();
        list.add(t);
        return (ArrayList<? extends T>)list;
    }
}
