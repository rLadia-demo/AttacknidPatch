/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.SparseArray
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import android.util.SparseArray;
import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLayer;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectGroup;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileSet;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMapProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXTiledMap
implements TMXConstants {
    private final SparseArray<TMXProperties<TMXTileProperty>> mGlobalTileIDToTMXTilePropertiesCache = new SparseArray();
    private final SparseArray<TextureRegion> mGlobalTileIDToTextureRegionCache = new SparseArray();
    private final String mOrientation;
    private final RectangleVertexBuffer mSharedVertexBuffer;
    private final ArrayList<TMXLayer> mTMXLayers = new ArrayList<TMXLayer>();
    private final ArrayList<TMXObjectGroup> mTMXObjectGroups = new ArrayList<TMXObjectGroup>();
    private final ArrayList<TMXTileSet> mTMXTileSets = new ArrayList<TMXTileSet>();
    private final TMXProperties<TMXTiledMapProperty> mTMXTiledMapProperties = new TMXProperties();
    private final int mTileColumns;
    private final int mTileHeight;
    private final int mTileWidth;
    private final int mTilesRows;

    TMXTiledMap(Attributes attributes) {
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

    void addTMXLayer(TMXLayer tMXLayer) {
        this.mTMXLayers.add(tMXLayer);
    }

    void addTMXObjectGroup(TMXObjectGroup tMXObjectGroup) {
        this.mTMXObjectGroups.add(tMXObjectGroup);
    }

    void addTMXTileSet(TMXTileSet tMXTileSet) {
        this.mTMXTileSets.add(tMXTileSet);
    }

    public void addTMXTiledMapProperty(TMXTiledMapProperty tMXTiledMapProperty) {
        this.mTMXTiledMapProperties.add((Object)tMXTiledMapProperty);
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

    public TMXProperties<TMXTileProperty> getTMXTileProperties(int n) {
        TMXProperties tMXProperties = (TMXProperties)this.mGlobalTileIDToTMXTilePropertiesCache.get(n);
        if (tMXProperties != null) {
            return tMXProperties;
        }
        ArrayList<TMXTileSet> arrayList = this.mTMXTileSets;
        int n2 = -1 + arrayList.size();
        do {
            TMXTileSet tMXTileSet;
            if (n2 < 0) {
                throw new IllegalArgumentException("No TMXTileProperties found for pGlobalTileID=" + n);
            }
            if (n >= (tMXTileSet = arrayList.get(n2)).getFirstGlobalTileID()) {
                return tMXTileSet.getTMXTilePropertiesFromGlobalTileID(n);
            }
            --n2;
        } while (true);
    }

    public TMXProperties<TMXTileProperty> getTMXTilePropertiesByGlobalTileID(int n) {
        return (TMXProperties)this.mGlobalTileIDToTMXTilePropertiesCache.get(n);
    }

    public ArrayList<TMXTileSet> getTMXTileSets() {
        return this.mTMXTileSets;
    }

    public TMXProperties<TMXTiledMapProperty> getTMXTiledMapProperties() {
        return this.mTMXTiledMapProperties;
    }

    public TextureRegion getTextureRegionFromGlobalTileID(int n) {
        SparseArray<TextureRegion> sparseArray = this.mGlobalTileIDToTextureRegionCache;
        TextureRegion textureRegion = (TextureRegion)sparseArray.get(n);
        if (textureRegion != null) {
            return textureRegion;
        }
        ArrayList<TMXTileSet> arrayList = this.mTMXTileSets;
        int n2 = -1 + arrayList.size();
        do {
            TMXTileSet tMXTileSet;
            if (n2 < 0) {
                throw new IllegalArgumentException("No TextureRegion found for pGlobalTileID=" + n);
            }
            if (n >= (tMXTileSet = arrayList.get(n2)).getFirstGlobalTileID()) {
                TextureRegion textureRegion2 = tMXTileSet.getTextureRegionFromGlobalTileID(n);
                sparseArray.put(n, (Object)textureRegion2);
                return textureRegion2;
            }
            --n2;
        } while (true);
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

