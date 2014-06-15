/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMap;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class TMXTile {
    int mGlobalTileID;
    TextureRegion mTextureRegion;
    private final int mTileColumn;
    private final int mTileHeight;
    private final int mTileRow;
    private final int mTileWidth;

    public TMXTile(int n, int n2, int n3, int n4, int n5, TextureRegion textureRegion) {
        this.mGlobalTileID = n;
        this.mTileRow = n3;
        this.mTileColumn = n2;
        this.mTileWidth = n4;
        this.mTileHeight = n5;
        this.mTextureRegion = textureRegion;
    }

    public int getGlobalTileID() {
        return this.mGlobalTileID;
    }

    public TMXProperties<TMXTileProperty> getTMXTileProperties(TMXTiledMap tMXTiledMap) {
        return tMXTiledMap.getTMXTileProperties(this.mGlobalTileID);
    }

    public TextureRegion getTextureRegion() {
        return this.mTextureRegion;
    }

    public int getTileColumn() {
        return this.mTileColumn;
    }

    public int getTileHeight() {
        return this.mTileHeight;
    }

    public int getTileRow() {
        return this.mTileRow;
    }

    public int getTileWidth() {
        return this.mTileWidth;
    }

    public int getTileX() {
        return this.mTileColumn * this.mTileWidth;
    }

    public int getTileY() {
        return this.mTileRow * this.mTileHeight;
    }

    public void setGlobalTileID(TMXTiledMap tMXTiledMap, int n) {
        this.mGlobalTileID = n;
        this.mTextureRegion = tMXTiledMap.getTextureRegionFromGlobalTileID(n);
    }

    public void setTextureRegion(TextureRegion textureRegion) {
        this.mTextureRegion = textureRegion;
    }
}

