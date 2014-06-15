/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.handler.collision;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.collision.ICollisionCallback;
import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.util.ListUtils;

public class CollisionHandler
implements IUpdateHandler {
    private final IShape mCheckShape;
    private final ICollisionCallback mCollisionCallback;
    private final ArrayList<? extends IShape> mTargetStaticEntities;

    public CollisionHandler(ICollisionCallback iCollisionCallback, IShape iShape, ArrayList<? extends IShape> arrayList) throws IllegalArgumentException {
        if (iCollisionCallback == null) {
            throw new IllegalArgumentException("pCollisionCallback must not be null!");
        }
        if (iShape == null) {
            throw new IllegalArgumentException("pCheckShape must not be null!");
        }
        if (arrayList == null) {
            throw new IllegalArgumentException("pTargetStaticEntities must not be null!");
        }
        this.mCollisionCallback = iCollisionCallback;
        this.mCheckShape = iShape;
        this.mTargetStaticEntities = arrayList;
    }

    public CollisionHandler(ICollisionCallback iCollisionCallback, IShape iShape, IShape iShape2) throws IllegalArgumentException {
        this(iCollisionCallback, iShape, ListUtils.toList(iShape2));
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void onUpdate(float f) {
        IShape iShape = this.mCheckShape;
        ArrayList<? extends IShape> arrayList = this.mTargetStaticEntities;
        int n = arrayList.size();
        for (int i = 0; i < n; ++i) {
            if (!iShape.collidesWith((IShape)arrayList.get(i))) continue;
            if (!this.mCollisionCallback.onCollision(iShape, (IShape)arrayList.get(i))) return;
        }
    }

    @Override
    public void reset() {
    }
}

