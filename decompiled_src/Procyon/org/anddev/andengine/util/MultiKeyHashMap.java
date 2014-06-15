package org.anddev.andengine.util;

import java.util.*;

public class MultiKeyHashMap<K, V> extends HashMap<MultiKey<K>, V>
{
    private static final long serialVersionUID = -6262447639526561122L;
    
    private boolean isEqualKey(final K[] array, final K[] array2) {
        if (array.length == array2.length) {
            for (int i = 0; i < array.length; ++i) {
                final K k = array[i];
                final K j = array2[i];
                if (k == null) {
                    if (j != null) {
                        return false;
                    }
                }
                else if (!k.equals(j)) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }
    
    public V get(final K... array) {
        final int hash = MultiKey.hash((Object[])array);
        for (final Map.Entry<MultiKey<K>, V> entry : this.entrySet()) {
            final MultiKey<K> multiKey = entry.getKey();
            if (multiKey.hashCode() == hash && this.isEqualKey(multiKey.getKeys(), array)) {
                return entry.getValue();
            }
        }
        return null;
    }
}
