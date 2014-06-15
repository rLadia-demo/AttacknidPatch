package org.anddev.andengine.extension.physics.box2d.util;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.util.pool.GenericPool;

public class Vector2Pool
{
  private static final GenericPool<Vector2> POOL = new GenericPool()
  {
    protected Vector2 onAllocatePoolItem()
    {
      return new Vector2();
    }
  };
  
  public static Vector2 obtain()
  {
    return (Vector2)POOL.obtainPoolItem();
  }
  
  public static Vector2 obtain(Vector2 paramVector2)
  {
    return ((Vector2)POOL.obtainPoolItem()).set(paramVector2);
  }
  
  public static void recycle(Vector2 paramVector2)
  {
    POOL.recylePoolItem(paramVector2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.Vector2Pool
 * JD-Core Version:    0.7.0.1
 */