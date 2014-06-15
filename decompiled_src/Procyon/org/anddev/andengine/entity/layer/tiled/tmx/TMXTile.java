package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.opengl.texture.region.*;

public class TMXTile
{
    int mGlobalTileID;
    TextureRegion mTextureRegion;
    private final int mTileColumn;
    private final int mTileHeight;
    private final int mTileRow;
    private final int mTileWidth;
    
    public TMXTile(final int mGlobalTileID, final int mTileColumn, final int mTileRow, final int mTileWidth, final int mTileHeight, final TextureRegion mTextureRegion) {
        super();
        this.mGlobalTileID = mGlobalTileID;
        this.mTileRow = mTileRow;
        this.mTileColumn = mTileColumn;
        this.mTileWidth = mTileWidth;
        this.mTileHeight = mTileHeight;
        this.mTextureRegion = mTextureRegion;
    }
    
    public int getGlobalTileID() {
        return this.mGlobalTileID;
    }
    
    public TMXProperties<TMXTileProperty> getTMXTileProperties(final TMXTiledMap tmxTiledMap) {
        return tmxTiledMap.getTMXTileProperties(this.mGlobalTileID);
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
    
    public void setGlobalTileID(final TMXTiledMap tmxTiledMap, final int mGlobalTileID) {
        this.mGlobalTileID = mGlobalTileID;
        this.mTextureRegion = tmxTiledMap.getTextureRegionFromGlobalTileID(mGlobalTileID);
    }
    
    public void setTextureRegion(final TextureRegion mTextureRegion) {
        this.mTextureRegion = mTextureRegion;
    }
}
