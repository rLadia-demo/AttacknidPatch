package org.anddev.andengine.engine.handler.collision;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.ListUtils;

public class CollisionHandler
  implements IUpdateHandler
{
  private final IShape mCheckShape;
  private final ICollisionCallback mCollisionCallback;
  private final ArrayList<? extends IShape> mTargetStaticEntities;
  
  public CollisionHandler(ICollisionCallback paramICollisionCallback, IShape paramIShape, ArrayList<? extends IShape> paramArrayList)
    throws IllegalArgumentException
  {
    if (paramICollisionCallback == null) {
      throw new IllegalArgumentException("pCollisionCallback must not be null!");
    }
    if (paramIShape == null) {
      throw new IllegalArgumentException("pCheckShape must not be null!");
    }
    if (paramArrayList == null) {
      throw new IllegalArgumentException("pTargetStaticEntities must not be null!");
    }
    this.mCollisionCallback = paramICollisionCallback;
    this.mCheckShape = paramIShape;
    this.mTargetStaticEntities = paramArrayList;
  }
  
  public CollisionHandler(ICollisionCallback paramICollisionCallback, IShape paramIShape1, IShape paramIShape2)
    throws IllegalArgumentException
  {
    this(paramICollisionCallback, paramIShape1, ListUtils.toList(paramIShape2));
  }
  
  public void onUpdate(float paramFloat)
  {
    IShape localIShape = this.mCheckShape;
    ArrayList localArrayList = this.mTargetStaticEntities;
    int i = localArrayList.size();
    for (int j = 0;; j++)
    {
      if (j >= i) {}
      while ((localIShape.collidesWith((IShape)localArrayList.get(j))) && (!this.mCollisionCallback.onCollision(localIShape, (IShape)localArrayList.get(j)))) {
        return;
      }
    }
  }
  
  public void reset() {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.handler.collision.CollisionHandler
 * JD-Core Version:    0.7.0.1
 */