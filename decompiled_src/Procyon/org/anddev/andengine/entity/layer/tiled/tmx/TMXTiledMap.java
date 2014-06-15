package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import android.util.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;
import java.util.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.buffer.*;

public class TMXTiledMap implements TMXConstants
{
    private final SparseArray<TMXProperties<TMXTileProperty>> mGlobalTileIDToTMXTilePropertiesCache;
    private final SparseArray<TextureRegion> mGlobalTileIDToTextureRegionCache;
    private final String mOrientation;
    private final RectangleVertexBuffer mSharedVertexBuffer;
    private final ArrayList<TMXLayer> mTMXLayers;
    private final ArrayList<TMXObjectGroup> mTMXObjectGroups;
    private final ArrayList<TMXTileSet> mTMXTileSets;
    private final TMXProperties<TMXTiledMapProperty> mTMXTiledMapProperties;
    private final int mTileColumns;
    private final int mTileHeight;
    private final int mTileWidth;
    private final int mTilesRows;
    
    TMXTiledMap(final Attributes attributes) {
        super();
        this.mTMXTileSets = new ArrayList<TMXTileSet>();
        this.mTMXLayers = new ArrayList<TMXLayer>();
        this.mTMXObjectGroups = new ArrayList<TMXObjectGroup>();
        this.mGlobalTileIDToTextureRegionCache = (SparseArray<TextureRegion>)new SparseArray();
        this.mGlobalTileIDToTMXTilePropertiesCache = (SparseArray<TMXProperties<TMXTileProperty>>)new SparseArray();
        this.mTMXTiledMapProperties = new TMXProperties<TMXTiledMapProperty>();
        this.mOrientation = attributes.getValue("", "orientation");
        if (!this.mOrientation.equals("orthogonal")) {
            throw new IllegalArgumentException("orientation: '" + this.mOrientation + "' is not supported.");
        }
        this.mTileColumns = SAXUtils.getIntAttributeOrThrow(attributes, "width");
        this.mTilesRows = SAXUtils.getIntAttributeOrThrow(attributes, "height");
        this.mTileWidth = SAXUtils.getIntAttributeOrThrow(attributes, "tilewidth");
        this.mTileHeight = SAXUtils.getIntAttributeOrThrow(attributes, "tileheight");
        this.mSharedVertexBuffer = new RectangleVertexBuffer(35044);
        BufferObjectManager.getActiveInstance().loadBufferObject(this.mSharedVertexBuffer);
        this.mSharedVertexBuffer.update(this.mTileWidth, this.mTileHeight);
    }
    
    void addTMXLayer(final TMXLayer tmxLayer) {
        this.mTMXLayers.add(tmxLayer);
    }
    
    void addTMXObjectGroup(final TMXObjectGroup tmxObjectGroup) {
        this.mTMXObjectGroups.add(tmxObjectGroup);
    }
    
    void addTMXTileSet(final TMXTileSet set) {
        this.mTMXTileSets.add(set);
    }
    
    public void addTMXTiledMapProperty(final TMXTiledMapProperty tmxTiledMapProperty) {
        this.mTMXTiledMapProperties.add(tmxTiledMapProperty);
    }
    
    @Deprecated
    public final int getHeight() {
        return this.mTilesRows;
    }
    
    public final String getOrientation() {
        return this.mOrientation;
    }
    
    public RectangleVertexBuffer getSharedVertexBuffer() {
        return this.mSharedVertexBuffer;
    }
    
    public ArrayList<TMXLayer> getTMXLayers() {
        return this.mTMXLayers;
    }
    
    public ArrayList<TMXObjectGroup> getTMXObjectGroups() {
        return this.mTMXObjectGroups;
    }
    
    public TMXProperties<TMXTileProperty> getTMXTileProperties(final int n) {
        final TMXProperties tmxProperties = (TMXProperties)this.mGlobalTileIDToTMXTilePropertiesCache.get(n);
        if (tmxProperties != null) {
            return (TMXProperties<TMXTileProperty>)tmxProperties;
        }
        final ArrayList<TMXTileSet> mtmxTileSets = this.mTMXTileSets;
        for (int i = -1 + mtmxTileSets.size(); i >= 0; --i) {
            final TMXTileSet set = mtmxTileSets.get(i);
            if (n >= set.getFirstGlobalTileID()) {
                return set.getTMXTilePropertiesFromGlobalTileID(n);
            }
        }
        throw new IllegalArgumentException("No TMXTileProperties found for pGlobalTileID=" + n);
    }
    
    public TMXProperties<TMXTileProperty> getTMXTilePropertiesByGlobalTileID(final int n) {
        return (TMXProperties<TMXTileProperty>)this.mGlobalTileIDToTMXTilePropertiesCache.get(n);
    }
    
    public ArrayList<TMXTileSet> getTMXTileSets() {
        return this.mTMXTileSets;
    }
    
    public TMXProperties<TMXTiledMapProperty> getTMXTiledMapProperties() {
        return this.mTMXTiledMapProperties;
    }
    
    public TextureRegion getTextureRegionFromGlobalTileID(final int n) {
        final SparseArray<TextureRegion> mGlobalTileIDToTextureRegionCache = this.mGlobalTileIDToTextureRegionCache;
        final TextureRegion textureRegion = (TextureRegion)mGlobalTileIDToTextureRegionCache.get(n);
        if (textureRegion != null) {
            return textureRegion;
        }
        final ArrayList<TMXTileSet> mtmxTileSets = this.mTMXTileSets;
        for (int i = -1 + mtmxTileSets.size(); i >= 0; --i) {
            final TMXTileSet set = mtmxTileSets.get(i);
            if (n >= set.getFirstGlobalTileID()) {
                final TextureRegion textureRegionFromGlobalTileID = set.getTextureRegionFromGlobalTileID(n);
                mGlobalTileIDToTextureRegionCache.put(n, (Object)textureRegionFromGlobalTileID);
                return textureRegionFromGlobalTileID;
            }
        }
        throw new IllegalArgumentException("No TextureRegion found for pGlobalTileID=" + n);
    }
    
    public final int getTileColumns() {
        return this.mTileColumns;
    }
    
    public final int getTileHeight() {
        return this.mTileHeight;
    }
    
    public final int getTileRows() {
        return this.mTilesRows;
    }
    
    public final int getTileWidth() {
        return this.mTileWidth;
    }
    
    @Deprecated
    public final int getWidth() {
        return this.mTileColumns;
    }
}
