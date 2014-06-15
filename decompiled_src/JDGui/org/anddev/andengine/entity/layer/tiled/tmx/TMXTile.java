package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class TMXTile
{
  int mGlobalTileID;
  TextureRegion mTextureRegion;
  private final int mTileColumn;
  private final int mTileHeight;
  private final int mTileRow;
  private final int mTileWidth;
  
  public TMXTile(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, TextureRegion paramTextureRegion)
  {
    this.mGlobalTileID = paramInt1;
    this.mTileRow = paramInt3;
    this.mTileColumn = paramInt2;
    this.mTileWidth = paramInt4;
    this.mTileHeight = paramInt5;
    this.mTextureRegion = paramTextureRegion;
  }
  
  public int getGlobalTileID()
  {
    return this.mGlobalTileID;
  }
  
  public TMXProperties<TMXTileProperty> getTMXTileProperties(TMXTiledMap paramTMXTiledMap)
  {
    return paramTMXTiledMap.getTMXTileProperties(this.mGlobalTileID);
  }
  
  public TextureRegion getTextureRegion()
  {
    return this.mTextureRegion;
  }
  
  public int getTileColumn()
  {
    return this.mTileColumn;
  }
  
  public int getTileHeight()
  {
    return this.mTileHeight;
  }
  
  public int getTileRow()
  {
    return this.mTileRow;
  }
  
  public int getTileWidth()
  {
    return this.mTileWidth;
  }
  
  public int getTileX()
  {
    return this.mTileColumn * this.mTileWidth;
  }
  
  public int getTileY()
  {
    return this.mTileRow * this.mTileHeight;
  }
  
  public void setGlobalTileID(TMXTiledMap paramTMXTiledMap, int paramInt)
  {
    this.mGlobalTileID = paramInt;
    this.mTextureRegion = paramTMXTiledMap.getTextureRegionFromGlobalTileID(paramInt);
  }
  
  public void setTextureRegion(TextureRegion paramTextureRegion)
  {
    this.mTextureRegion = paramTextureRegion;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXTile
 * JD-Core Version:    0.7.0.1
 */