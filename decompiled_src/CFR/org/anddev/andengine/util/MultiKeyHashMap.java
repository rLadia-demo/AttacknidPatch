/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.anddev.andengine.util.MultiKey;

public class MultiKeyHashMap<K, V>
extends HashMap<MultiKey<K>, V> {
    private static final long serialVersionUID = -6262447639526561122L;

    /*
     * Enabled aggressive block sorting
     */
    private boolean isEqualKey(K[] arrK, K[] arrK2) {
        if (arrK.length != arrK2.length) {
            return false;
        }
        for (int i = 0; i < arrK.length; ++i) {
            K K = arrK[i];
            K K2 = arrK2[i];
            if (K == null) {
                if (K2 != null) return false;
                continue;
            }
            if (!K.equals(K2)) return false;
        }
        return true;
    }

    public /* varargs */ V get(K ... arrK) {
        MultiKey multiKey;
        Map.Entry entry;
        int n = MultiKey.hash(arrK);
        Iterator iterator = this.entrySet().iterator();
        do {
            if (iterator.hasNext()) continue;
            return null;
        } while ((multiKey = (MultiKey)(entry = (Map.Entry)iterator.next()).getKey()).hashCode() != n || !this.isEqualKey(multiKey.getKeys(), arrK));
        return entry.getValue();
    }
}

