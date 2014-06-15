package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;

public class TiledSprite
  extends BaseSprite
{
  public TiledSprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, TiledTextureRegion paramTiledTextureRegion)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramTiledTextureRegion);
  }
  
  public TiledSprite(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, TiledTextureRegion paramTiledTextureRegion, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramTiledTextureRegion, paramRectangleVertexBuffer);
  }
  
  public TiledSprite(float paramFloat1, float paramFloat2, TiledTextureRegion paramTiledTextureRegion)
  {
    super(paramFloat1, paramFloat2, paramTiledTextureRegion.getTileWidth(), paramTiledTextureRegion.getTileHeight(), paramTiledTextureRegion);
  }
  
  public TiledSprite(float paramFloat1, float paramFloat2, TiledTextureRegion paramTiledTextureRegion, RectangleVertexBuffer paramRectangleVertexBuffer)
  {
    super(paramFloat1, paramFloat2, paramTiledTextureRegion.getTileWidth(), paramTiledTextureRegion.getTileHeight(), paramTiledTextureRegion, paramRectangleVertexBuffer);
  }
  
  public int getCurrentTileIndex()
  {
    return getTextureRegion().getCurrentTileIndex();
  }
  
  public TiledTextureRegion getTextureRegion()
  {
    return (TiledTextureRegion)super.getTextureRegion();
  }
  
  public void nextTile()
  {
    getTextureRegion().nextTile();
  }
  
  public void setCurrentTileIndex(int paramInt)
  {
    getTextureRegion().setCurrentTileIndex(paramInt);
  }
  
  public void setCurrentTileIndex(int paramInt1, int paramInt2)
  {
    getTextureRegion().setCurrentTileIndex(paramInt1, paramInt2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.sprite.TiledSprite
 * JD-Core Version:    0.7.0.1
 */