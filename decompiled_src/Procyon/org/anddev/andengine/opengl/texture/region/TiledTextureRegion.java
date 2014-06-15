package org.anddev.andengine.opengl.texture.region;

import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.region.buffer.*;

public class TiledTextureRegion extends BaseTextureRegion
{
    private int mCurrentTileColumn;
    private int mCurrentTileRow;
    private final int mTileColumns;
    private final int mTileCount;
    private final int mTileRows;
    
    public TiledTextureRegion(final Texture texture, final int n, final int n2, final int n3, final int n4, final int mTileColumns, final int mTileRows) {
        super(texture, n, n2, n3, n4);
        this.mTileColumns = mTileColumns;
        this.mTileRows = mTileRows;
        this.mTileCount = this.mTileColumns * this.mTileRows;
        this.mCurrentTileColumn = 0;
        this.mCurrentTileRow = 0;
        this.initTextureBuffer();
    }
    
    public TiledTextureRegion clone() {
        final TiledTextureRegion tiledTextureRegion = new TiledTextureRegion(this.mTexture, this.getTexturePositionX(), this.getTexturePositionY(), this.getWidth(), this.getHeight(), this.mTileColumns, this.mTileRows);
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
        if (this.mTileRows != 0 && this.mTileColumns != 0) {
            super.initTextureBuffer();
        }
    }
    
    public void nextTile() {
        this.setCurrentTileIndex((1 + this.getCurrentTileIndex()) % this.getTileCount());
    }
    
    @Override
    protected TiledTextureRegionBuffer onCreateTextureRegionBuffer() {
        return new TiledTextureRegionBuffer(this, 35044);
    }
    
    public void setCurrentTileIndex(final int n) {
        if (n < this.mTileCount) {
            final int mTileColumns = this.mTileColumns;
            this.setCurrentTileIndex(n % mTileColumns, n / mTileColumns);
        }
    }
    
    public void setCurrentTileIndex(final int mCurrentTileColumn, final int mCurrentTileRow) {
        if (mCurrentTileColumn != this.mCurrentTileColumn || mCurrentTileRow != this.mCurrentTileRow) {
            this.mCurrentTileColumn = mCurrentTileColumn;
            this.mCurrentTileRow = mCurrentTileRow;
            super.updateTextureRegionBuffer();
        }
    }
}
