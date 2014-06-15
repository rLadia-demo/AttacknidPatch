package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;

public class TiledSprite extends BaseSprite
{
    public TiledSprite(final float n, final float n2, final float n3, final float n4, final TiledTextureRegion tiledTextureRegion) {
        super(n, n2, n3, n4, tiledTextureRegion);
    }
    
    public TiledSprite(final float n, final float n2, final float n3, final float n4, final TiledTextureRegion tiledTextureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, tiledTextureRegion, rectangleVertexBuffer);
    }
    
    public TiledSprite(final float n, final float n2, final TiledTextureRegion tiledTextureRegion) {
        super(n, n2, tiledTextureRegion.getTileWidth(), tiledTextureRegion.getTileHeight(), tiledTextureRegion);
    }
    
    public TiledSprite(final float n, final float n2, final TiledTextureRegion tiledTextureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, tiledTextureRegion.getTileWidth(), tiledTextureRegion.getTileHeight(), tiledTextureRegion, rectangleVertexBuffer);
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
    
    public void setCurrentTileIndex(final int currentTileIndex) {
        this.getTextureRegion().setCurrentTileIndex(currentTileIndex);
    }
    
    public void setCurrentTileIndex(final int n, final int n2) {
        this.getTextureRegion().setCurrentTileIndex(n, n2);
    }
}
