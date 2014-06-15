/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.handler.collision;

import org.anddev.andengine.entity.shape.IShape;

public interface ICollisionCallback {
    public boolean onCollision(IShape var1, IShape var2);
}

