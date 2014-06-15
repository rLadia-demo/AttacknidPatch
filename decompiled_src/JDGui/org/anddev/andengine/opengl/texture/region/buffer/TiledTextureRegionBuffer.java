package org.anddev.andengine.opengl.texture.region.buffer;

import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;

public class TiledTextureRegionBuffer
  extends BaseTextureRegionBuffer
{
  public TiledTextureRegionBuffer(TiledTextureRegion paramTiledTextureRegion, int paramInt)
  {
    super(paramTiledTextureRegion, paramInt);
  }
  
  public TiledTextureRegion getTextureRegion()
  {
    return (TiledTextureRegion)super.getTextureRegion();
  }
  
  protected float getX1()
  {
    TiledTextureRegion localTiledTextureRegion = getTextureRegion();
    return localTiledTextureRegion.getTexturePositionOfCurrentTileX() / localTiledTextureRegion.getTexture().getWidth();
  }
  
  protected float getX2()
  {
    TiledTextureRegion localTiledTextureRegion = getTextureRegion();
    return (localTiledTextureRegion.getTexturePositionOfCurrentTileX() + localTiledTextureRegion.getTileWidth()) / localTiledTextureRegion.getTexture().getWidth();
  }
  
  protected float getY1()
  {
    TiledTextureRegion localTiledTextureRegion = getTextureRegion();
    return localTiledTextureRegion.getTexturePositionOfCurrentTileY() / localTiledTextureRegion.getTexture().getHeight();
  }
  
  protected float getY2()
  {
    TiledTextureRegion localTiledTextureRegion = getTextureRegion();
    return (localTiledTextureRegion.getTexturePositionOfCurrentTileY() + localTiledTextureRegion.getTileHeight()) / localTiledTextureRegion.getTexture().getHeight();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.buffer.TiledTextureRegionBuffer
 * JD-Core Version:    0.7.0.1
 */