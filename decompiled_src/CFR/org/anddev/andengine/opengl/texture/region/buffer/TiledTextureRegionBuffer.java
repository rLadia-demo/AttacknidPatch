/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;

public class TiledTextureRegionBuffer
extends BaseTextureRegionBuffer {
    public TiledTextureRegionBuffer(TiledTextureRegion tiledTextureRegion, int n) {
        super(tiledTextureRegion, n);
    }

    @Override
    public TiledTextureRegion getTextureRegion() {
        return (TiledTextureRegion)super.getTextureRegion();
    }

    @Override
    protected float getX1() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return baseTextureRegion.getTexturePositionOfCurrentTileX() / (float)baseTextureRegion.getTexture().getWidth();
    }

    @Override
    protected float getX2() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (baseTextureRegion.getTexturePositionOfCurrentTileX() + (float)baseTextureRegion.getTileWidth()) / (float)baseTextureRegion.getTexture().getWidth();
    }

    @Override
    protected float getY1() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return baseTextureRegion.getTexturePositionOfCurrentTileY() / (float)baseTextureRegion.getTexture().getHeight();
    }

    @Override
    protected float getY2() {
        BaseTextureRegion baseTextureRegion = this.getTextureRegion();
        return (baseTextureRegion.getTexturePositionOfCurrentTileY() + (float)baseTextureRegion.getTileHeight()) / (float)baseTextureRegion.getTexture().getHeight();
    }
}

