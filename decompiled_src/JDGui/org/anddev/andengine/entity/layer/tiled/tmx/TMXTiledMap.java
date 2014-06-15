package org.anddev.andengine.entity.layer.tiled.tmx;

import android.util.SparseArray;
import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXTiledMap
  implements TMXConstants
{
  private final SparseArray<TMXProperties<TMXTileProperty>> mGlobalTileIDToTMXTilePropertiesCache = new SparseArray();
  private final SparseArray<TextureRegion> mGlobalTileIDToTextureRegionCache = new SparseArray();
  private final String mOrientation;
  private final RectangleVertexBuffer mSharedVertexBuffer;
  private final ArrayList<TMXLayer> mTMXLayers = new ArrayList();
  private final ArrayList<TMXObjectGroup> mTMXObjectGroups = new ArrayList();
  private final ArrayList<TMXTileSet> mTMXTileSets = new ArrayList();
  private final TMXProperties<TMXTiledMapProperty> mTMXTiledMapProperties = new TMXProperties();
  private final int mTileColumns;
  private final int mTileHeight;
  private final int mTileWidth;
  private final int mTilesRows;
  
  TMXTiledMap(Attributes paramAttributes)
  {
    this.mOrientation = paramAttributes.getValue("", "orientation");
    if (!this.mOrientation.equals("orthogonal")) {
      throw new IllegalArgumentException("orientation: '" + this.mOrientation + "' is not supported.");
    }
    this.mTileColumns = SAXUtils.getIntAttributeOrThrow(paramAttributes, "width");
    this.mTilesRows = SAXUtils.getIntAttributeOrThrow(paramAttributes, "height");
    this.mTileWidth = SAXUtils.getIntAttributeOrThrow(paramAttributes, "tilewidth");
    this.mTileHeight = SAXUtils.getIntAttributeOrThrow(paramAttributes, "tileheight");
    this.mSharedVertexBuffer = new RectangleVertexBuffer(35044);
    BufferObjectManager.getActiveInstance().loadBufferObject(this.mSharedVertexBuffer);
    this.mSharedVertexBuffer.update(this.mTileWidth, this.mTileHeight);
  }
  
  void addTMXLayer(TMXLayer paramTMXLayer)
  {
    this.mTMXLayers.add(paramTMXLayer);
  }
  
  void addTMXObjectGroup(TMXObjectGroup paramTMXObjectGroup)
  {
    this.mTMXObjectGroups.add(paramTMXObjectGroup);
  }
  
  void addTMXTileSet(TMXTileSet paramTMXTileSet)
  {
    this.mTMXTileSets.add(paramTMXTileSet);
  }
  
  public void addTMXTiledMapProperty(TMXTiledMapProperty paramTMXTiledMapProperty)
  {
    this.mTMXTiledMapProperties.add(paramTMXTiledMapProperty);
  }
  
  @Deprecated
  public final int getHeight()
  {
    return this.mTilesRows;
  }
  
  public final String getOrientation()
  {
    return this.mOrientation;
  }
  
  public RectangleVertexBuffer getSharedVertexBuffer()
  {
    return this.mSharedVertexBuffer;
  }
  
  public ArrayList<TMXLayer> getTMXLayers()
  {
    return this.mTMXLayers;
  }
  
  public ArrayList<TMXObjectGroup> getTMXObjectGroups()
  {
    return this.mTMXObjectGroups;
  }
  
  public TMXProperties<TMXTileProperty> getTMXTileProperties(int paramInt)
  {
    TMXProperties localTMXProperties = (TMXProperties)this.mGlobalTileIDToTMXTilePropertiesCache.get(paramInt);
    if (localTMXProperties != null) {
      return localTMXProperties;
    }
    ArrayList localArrayList = this.mTMXTileSets;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        throw new IllegalArgumentException("No TMXTileProperties found for pGlobalTileID=" + paramInt);
      }
      TMXTileSet localTMXTileSet = (TMXTileSet)localArrayList.get(i);
      if (paramInt >= localTMXTileSet.getFirstGlobalTileID()) {
        return localTMXTileSet.getTMXTilePropertiesFromGlobalTileID(paramInt);
      }
    }
  }
  
  public TMXProperties<TMXTileProperty> getTMXTilePropertiesByGlobalTileID(int paramInt)
  {
    return (TMXProperties)this.mGlobalTileIDToTMXTilePropertiesCache.get(paramInt);
  }
  
  public ArrayList<TMXTileSet> getTMXTileSets()
  {
    return this.mTMXTileSets;
  }
  
  public TMXProperties<TMXTiledMapProperty> getTMXTiledMapProperties()
  {
    return this.mTMXTiledMapProperties;
  }
  
  public TextureRegion getTextureRegionFromGlobalTileID(int paramInt)
  {
    SparseArray localSparseArray = this.mGlobalTileIDToTextureRegionCache;
    TextureRegion localTextureRegion1 = (TextureRegion)localSparseArray.get(paramInt);
    if (localTextureRegion1 != null) {
      return localTextureRegion1;
    }
    ArrayList localArrayList = this.mTMXTileSets;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0) {
        throw new IllegalArgumentException("No TextureRegion found for pGlobalTileID=" + paramInt);
      }
      TMXTileSet localTMXTileSet = (TMXTileSet)localArrayList.get(i);
      if (paramInt >= localTMXTileSet.getFirstGlobalTileID())
      {
        TextureRegion localTextureRegion2 = localTMXTileSet.getTextureRegionFromGlobalTileID(paramInt);
        localSparseArray.put(paramInt, localTextureRegion2);
        return localTextureRegion2;
      }
    }
  }
  
  public final int getTileColumns()
  {
    return this.mTileColumns;
  }
  
  public final int getTileHeight()
  {
    return this.mTileHeight;
  }
  
  public final int getTileRows()
  {
    return this.mTilesRows;
  }
  
  public final int getTileWidth()
  {
    return this.mTileWidth;
  }
  
  @Deprecated
  public final int getWidth()
  {
    return this.mTileColumns;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMap
 * JD-Core Version:    0.7.0.1
 */