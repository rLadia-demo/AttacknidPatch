package org.anddev.andengine.engine.handler.collision;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.entity.shape.*;
import java.util.*;
import org.anddev.andengine.util.*;

public class CollisionHandler implements IUpdateHandler
{
    private final IShape mCheckShape;
    private final ICollisionCallback mCollisionCallback;
    private final ArrayList<? extends IShape> mTargetStaticEntities;
    
    public CollisionHandler(final ICollisionCallback mCollisionCallback, final IShape mCheckShape, final ArrayList<? extends IShape> mTargetStaticEntities) throws IllegalArgumentException {
        super();
        if (mCollisionCallback == null) {
            throw new IllegalArgumentException("pCollisionCallback must not be null!");
        }
        if (mCheckShape == null) {
            throw new IllegalArgumentException("pCheckShape must not be null!");
        }
        if (mTargetStaticEntities == null) {
            throw new IllegalArgumentException("pTargetStaticEntities must not be null!");
        }
        this.mCollisionCallback = mCollisionCallback;
        this.mCheckShape = mCheckShape;
        this.mTargetStaticEntities = mTargetStaticEntities;
    }
    
    public CollisionHandler(final ICollisionCallback collisionCallback, final IShape shape, final IShape shape2) throws IllegalArgumentException {
        this(collisionCallback, shape, ListUtils.toList(shape2));
    }
    
    @Override
    public void onUpdate(final float n) {
        final IShape mCheckShape = this.mCheckShape;
        final ArrayList<? extends IShape> mTargetStaticEntities = this.mTargetStaticEntities;
        for (int size = mTargetStaticEntities.size(), n2 = 0; n2 < size && (!mCheckShape.collidesWith(mTargetStaticEntities.get(n2)) || this.mCollisionCallback.onCollision(mCheckShape, mTargetStaticEntities.get(n2))); ++n2) {}
    }
    
    @Override
    public void reset() {
    }
}
