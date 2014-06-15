/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class SpriteMenuItem
extends Sprite
implements IMenuItem {
    private final int mID;

    public SpriteMenuItem(int n, TextureRegion textureRegion) {
        super(0.0f, 0.0f, textureRegion);
        this.mID = n;
    }

    @Override
    public int getID() {
        return this.mID;
    }

    @Override
    public void onSelected() {
    }

    @Override
    public void onUnselected() {
    }
}

