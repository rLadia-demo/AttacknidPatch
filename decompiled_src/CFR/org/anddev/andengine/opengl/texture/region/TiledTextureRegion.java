/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.BaseTextureRegion;
import org.anddev.andengine.opengl.texture.region.buffer.BaseTextureRegionBuffer;
import org.anddev.andengine.opengl.texture.region.buffer.TiledTextureRegionBuffer;

public class TiledTextureRegion
extends BaseTextureRegion {
    private int mCurrentTileColumn;
    private int mCurrentTileRow;
    private final int mTileColumns;
    private final int mTileCount;
    private final int mTileRows;

    public TiledTextureRegion(Texture texture, int n, int n2, int n3, int n4, int n5, int n6) {
        super(texture, n, n2, n3, n4);
        this.mTileColumns = n5;
        this.mTileRows = n6;
        this.mTileCount = this.mTileColumns * this.mTileRows;
        this.mCurrentTileColumn = 0;
        this.mCurrentTileRow = 0;
        this.initTextureBuffer();
    }

    public TiledTextureRegion clone() {
        TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(this.mTexture, this.getTexturePositionX(), this.getTexturePositionY(), this.getWidth(), this.getHeight(), this.mTileColumns, this.mTileRows);
        tiledTextureRegion.setCurrentTileIndex(this.mCurrentTileColumn, this.mCurrentTileRow);
        return tiledTextureRegion;
    }

    public int getCurrentTileColumn() {
        return this.mCurrentTileColumn;
    }

    public int getCurrentTileIndex() {
        return this.mCurrentTileRow * this.mTileColumns + this.mCurrentTileColumn;
    }

    public int getCurrentTileRow() {
        return this.mCurrentTileRow;
    }

    @Override
    public TiledTextureRegionBuffer getTextureBuffer() {
        return (TiledTextureRegionBuffer)this.mTextureRegionBuffer;
    }

    public float getTexturePositionOfCurrentTileX() {
        return super.getTexturePositionX() + this.mCurrentTileColumn * this.getTileWidth();
    }

    public float getTexturePositionOfCurrentTileY() {
        return super.getTexturePositionY() + this.mCurrentTileRow * this.getTileHeight();
    }

    public int getTileCount() {
        return this.mTileCount;
    }

    public int getTileHeight() {
        return super.getHeight() / this.mTileRows;
    }

    public int getTileWidth() {
        return super.getWidth() / this.mTileColumns;
    }

    @Override
    protected void initTextureBuffer() {
        if (this.mTileRows == 0 || this.mTileColumns == 0) return;
        super.initTextureBuffer();
    }

    public void nextTile() {
        this.setCurrentTileIndex((1 + this.getCurrentTileIndex()) % this.getTileCount());
    }

    @Override
    protected TiledTextureRegionBuffer onCreateTextureRegionBuffer() {
        return new TiledTextureRegionBuffer(this, 35044);
    }

    public void setCurrentTileIndex(int n) {
        if (n >= this.mTileCount) return;
        int n2 = this.mTileColumns;
        this.setCurrentTileIndex(n % n2, n / n2);
    }

    public void setCurrentTileIndex(int n, int n2) {
        if (n == this.mCurrentTileColumn && n2 == this.mCurrentTileRow) return;
        this.mCurrentTileColumn = n;
        this.mCurrentTileRow = n2;
        super.updateTextureRegionBuffer();
    }
}

