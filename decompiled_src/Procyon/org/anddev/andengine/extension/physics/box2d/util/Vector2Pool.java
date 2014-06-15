package org.anddev.andengine.extension.physics.box2d.util;

import org.anddev.andengine.util.pool.*;
import com.badlogic.gdx.math.*;

public class Vector2Pool
{
    private static final GenericPool<Vector2> POOL;
    
    static {
        POOL = new GenericPool<Vector2>() {
            @Override
            protected Vector2 onAllocatePoolItem() {
                return new Vector2();
            }
        };
    }
    
    public static Vector2 obtain() {
        return Vector2Pool.POOL.obtainPoolItem();
    }
    
    public static Vector2 obtain(final Vector2 vector2) {
        return Vector2Pool.POOL.obtainPoolItem().set(vector2);
    }
    
    public static void recycle(final Vector2 vector2) {
        Vector2Pool.POOL.recylePoolItem((Object)vector2);
    }
}
