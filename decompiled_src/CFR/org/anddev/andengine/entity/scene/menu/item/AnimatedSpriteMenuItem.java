/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.entity.sprite.AnimatedSprite;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;

public class AnimatedSpriteMenuItem
extends AnimatedSprite
implements IMenuItem {
    private final int mID;

    public AnimatedSpriteMenuItem(int n, TiledTextureRegion tiledTextureRegion) {
        super(0.0f, 0.0f, tiledTextureRegion);
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

