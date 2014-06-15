package org.anddev.andengine.entity.layer.tiled.tmx;

import java.util.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;

public class TMXProperties<T extends TMXProperty> extends ArrayList<T> implements TMXConstants
{
    private static final long serialVersionUID = 8912773556975105201L;
    
    public boolean containsTMXProperty(final String s, final String s2) {
        for (int i = -1 + this.size(); i >= 0; --i) {
            final TMXProperty tmxProperty = this.get(i);
            if (tmxProperty.getName().equals(s) && tmxProperty.getValue().equals(s2)) {
                return true;
            }
        }
        return false;
    }
}
