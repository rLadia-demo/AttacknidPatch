/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.shape.IShape;

public interface IMenuItem
extends IShape {
    public int getID();

    public void onSelected();

    public void onUnselected();
}

