/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity;

import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.opengl.IDrawable;

public interface IEntity
extends IDrawable,
IUpdateHandler {
    public int getZIndex();

    public void setZIndex(int var1);
}

