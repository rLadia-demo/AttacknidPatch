package org.anddev.andengine.engine.handler.collision;

import org.anddev.andengine.entity.shape.*;

public interface ICollisionCallback
{
    boolean onCollision(IShape p0, IShape p1);
}
