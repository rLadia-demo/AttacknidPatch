/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.entity.sprite.BaseSprite;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class TiledSprite
extends BaseSprite {
    public TiledSprite(float f, float f2, float f3, float f4, TiledTextureRegion tiledTextureRegion) {
        super(f, f2, f3, f4, tiledTextureRegion);
    }

    public TiledSprite(float f, float f2, float f3, float f4, TiledTextureRegion tiledTextureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, tiledTextureRegion, rectangleVertexBuffer);
    }

    public TiledSprite(float f, float f2, TiledTextureRegion tiledTextureRegion) {
        super(f, f2, tiledTextureRegion.getTileWidth(), tiledTextureRegion.getTileHeight(), tiledTextureRegion);
    }

    public TiledSprite(float f, float f2, TiledTextureRegion tiledTextureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, tiledTextureRegion.getTileWidth(), tiledTextureRegion.getTileHeight(), tiledTextureRegion, rectangleVertexBuffer);
    }

    public int getCurrentTileIndex() {
        return this.getTextureRegion().getCurrentTileIndex();
    }

    @Override
    public TiledTextureRegion getTextureRegion() {
        return (TiledTextureRegion)super.getTextureRegion();
    }

    public void nextTile() {
        this.getTextureRegion().nextTile();
    }

    public void setCurrentTileIndex(int n) {
        this.getTextureRegion().setCurrentTileIndex(n);
    }

    public void setCurrentTileIndex(int n, int n2) {
        this.getTextureRegion().setCurrentTileIndex(n, n2);
    }
}

