/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.util.Arrays;

public class MultiKey<K> {
    private static final long serialVersionUID = 4465448607415788805L;
    private final int mCachedHashCode;
    private final K[] mKeys;

    public /* varargs */ MultiKey(K ... arrK) {
        this.mKeys = arrK;
        this.mCachedHashCode = MultiKey.hash(arrK);
    }

    public static /* varargs */ int hash(Object ... arrobject) {
        int n = 0;
        int n2 = arrobject.length;
        int n3 = 0;
        while (n3 < n2) {
            Object object;
            if ((object = arrobject[n3]) != null) {
                n^=object.hashCode();
            }
            ++n3;
        }
        return n;
    }

    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof MultiKey)) return false;
        MultiKey multiKey = (MultiKey)object;
        return Arrays.equals(this.mKeys, multiKey.mKeys);
    }

    public K getKey(int n) {
        return this.mKeys[n];
    }

    public K[] getKeys() {
        return this.mKeys;
    }

    public int hashCode() {
        return this.mCachedHashCode;
    }

    public int size() {
        return this.mKeys.length;
    }

    public String toString() {
        return "MultiKey" + Arrays.asList(this.mKeys).toString();
    }
}

