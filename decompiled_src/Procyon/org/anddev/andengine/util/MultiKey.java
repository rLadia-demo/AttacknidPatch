package org.anddev.andengine.util;

import java.util.*;

public class MultiKey<K>
{
    private static final long serialVersionUID = 4465448607415788805L;
    private final int mCachedHashCode;
    private final K[] mKeys;
    
    public MultiKey(final K... mKeys) {
        super();
        this.mKeys = mKeys;
        this.mCachedHashCode = hash((Object[])mKeys);
    }
    
    public static int hash(final Object... array) {
        int n = 0;
        for (final Object o : array) {
            if (o != null) {
                n ^= o.hashCode();
            }
        }
        return n;
    }
    
    @Override
    public boolean equals(final Object o) {
        return o == this || (o instanceof MultiKey && Arrays.equals(this.mKeys, ((MultiKey)o).mKeys));
    }
    
    public K getKey(final int n) {
        return (K)this.mKeys[n];
    }
    
    public K[] getKeys() {
        return (K[])this.mKeys;
    }
    
    @Override
    public int hashCode() {
        return this.mCachedHashCode;
    }
    
    public int size() {
        return this.mKeys.length;
    }
    
    @Override
    public String toString() {
        return "MultiKey" + Arrays.asList(this.mKeys).toString();
    }
}
