/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;

public class TMXProperties<T extends TMXProperty>
extends ArrayList<T>
implements TMXConstants {
    private static final long serialVersionUID = 8912773556975105201L;

    public boolean containsTMXProperty(String string, String string2) {
        int n = -1 + this.size();
        while (n >= 0) {
            TMXProperty tMXProperty;
            if ((tMXProperty = (TMXProperty)this.get(n)).getName().equals(string) && tMXProperty.getValue().equals(string2)) {
                return true;
            }
            --n;
        }
        return false;
    }
}

