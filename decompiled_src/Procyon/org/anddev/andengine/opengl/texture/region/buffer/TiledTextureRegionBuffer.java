package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.region.*;

public class TiledTextureRegionBuffer extends BaseTextureRegionBuffer
{
    public TiledTextureRegionBuffer(final TiledTextureRegion tiledTextureRegion, final int n) {
        super(tiledTextureRegion, n);
    }
    
    @Override
    public TiledTextureRegion getTextureRegion() {
        return (TiledTextureRegion)super.getTextureRegion();
    }
    
    @Override
    protected float getX1() {
        final TiledTextureRegion textureRegion = this.getTextureRegion();
        return textureRegion.getTexturePositionOfCurrentTileX() / textureRegion.getTexture().getWidth();
    }
    
    @Override
    protected float getX2() {
        final TiledTextureRegion textureRegion = this.getTextureRegion();
        return (textureRegion.getTexturePositionOfCurrentTileX() + textureRegion.getTileWidth()) / textureRegion.getTexture().getWidth();
    }
    
    @Override
    protected float getY1() {
        final TiledTextureRegion textureRegion = this.getTextureRegion();
        return textureRegion.getTexturePositionOfCurrentTileY() / textureRegion.getTexture().getHeight();
    }
    
    @Override
    protected float getY2() {
        final TiledTextureRegion textureRegion = this.getTextureRegion();
        return (textureRegion.getTexturePositionOfCurrentTileY() + textureRegion.getTileHeight()) / textureRegion.getTexture().getHeight();
    }
}
