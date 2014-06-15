package org.anddev.andengine.entity.layer.tiled.tmx;

import org.xml.sax.helpers.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import java.util.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.*;
import java.io.*;

public class TMXParser extends DefaultHandler implements TMXConstants
{
    private final Context mContext;
    private String mDataCompression;
    private String mDataEncoding;
    private boolean mInData;
    private boolean mInImage;
    private boolean mInLayer;
    private boolean mInMap;
    private boolean mInObject;
    private boolean mInObjectGroup;
    private boolean mInProperties;
    private boolean mInProperty;
    private boolean mInTile;
    private boolean mInTileset;
    private int mLastTileSetTileID;
    private final StringBuilder mStringBuilder;
    private final TMXLoader.ITMXTilePropertiesListener mTMXTilePropertyListener;
    private TMXTiledMap mTMXTiledMap;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;
    
    public TMXParser(final Context mContext, final TextureManager mTextureManager, final TextureOptions mTextureOptions, final TMXLoader.ITMXTilePropertiesListener mtmxTilePropertyListener) {
        super();
        this.mStringBuilder = new StringBuilder();
        this.mContext = mContext;
        this.mTextureManager = mTextureManager;
        this.mTextureOptions = mTextureOptions;
        this.mTMXTilePropertyListener = mtmxTilePropertyListener;
    }
    
    @Override
    public void characters(final char[] array, final int n, final int n2) throws SAXException {
        this.mStringBuilder.append(array, n, n2);
    }
    
    @Override
    public void endElement(final String s, final String s2, final String s3) throws SAXException {
        Label_0014: {
            if (s2.equals("map")) {
                this.mInMap = false;
            }
            else if (s2.equals("tileset")) {
                this.mInTileset = false;
            }
            else if (s2.equals("image")) {
                this.mInImage = false;
            }
            else if (s2.equals("tile")) {
                this.mInTile = false;
            }
            else if (s2.equals("properties")) {
                this.mInProperties = false;
            }
            else if (s2.equals("property")) {
                this.mInProperty = false;
            }
            else if (s2.equals("layer")) {
                this.mInLayer = false;
            }
            else {
                if (s2.equals("data")) {
                    Label_0223: {
                        if (this.mDataCompression == null || this.mDataEncoding == null) {
                            break Label_0223;
                        }
                        int n = 1;
                    Label_0205_Outer:
                        while (true) {
                            Label_0215: {
                                if (n == 0) {
                                    break Label_0215;
                                }
                                final ArrayList<TMXLayer> tmxLayers = this.mTMXTiledMap.getTMXLayers();
                                while (true) {
                                    try {
                                        tmxLayers.get(-1 + tmxLayers.size()).initializeTMXTilesFromDataString(this.mStringBuilder.toString().trim(), this.mDataEncoding, this.mDataCompression, this.mTMXTilePropertyListener);
                                        this.mDataCompression = null;
                                        this.mDataEncoding = null;
                                        this.mInData = false;
                                        break Label_0014;
                                        n = 0;
                                        continue Label_0205_Outer;
                                    }
                                    catch (IOException ex) {
                                        Debug.e(ex);
                                        continue;
                                    }
                                    break;
                                }
                            }
                            break;
                        }
                    }
                }
                if (s2.equals("objectgroup")) {
                    this.mInObjectGroup = false;
                }
                else {
                    if (!s2.equals("object")) {
                        throw new TMXParseException("Unexpected end tag: '" + s2 + "'.");
                    }
                    this.mInObject = false;
                }
            }
        }
        this.mStringBuilder.setLength(0);
    }
    
    TMXTiledMap getTMXTiledMap() {
        return this.mTMXTiledMap;
    }
    
    @Override
    public void startElement(final String s, final String s2, final String s3, final Attributes attributes) throws SAXException {
        if (s2.equals("map")) {
            this.mInMap = true;
            this.mTMXTiledMap = new TMXTiledMap(attributes);
        }
        else {
            Label_0163: {
                if (s2.equals("tileset")) {
                    this.mInTileset = true;
                    final String value = attributes.getValue("", "source");
                    TMXTileSet loadFromAsset = null;
                    Label_0075: {
                        if (value != null) {
                            try {
                                loadFromAsset = new TSXLoader(this.mContext, this.mTextureManager, this.mTextureOptions).loadFromAsset(this.mContext, SAXUtils.getIntAttribute(attributes, "firstgid", 1), value);
                                break Label_0075;
                            }
                            catch (TSXLoadException ex) {
                                throw new TMXParseException("Failed to load TMXTileSet from source: " + value, ex);
                            }
                            break Label_0163;
                        }
                        loadFromAsset = new TMXTileSet(attributes, this.mTextureOptions);
                    }
                    this.mTMXTiledMap.addTMXTileSet(loadFromAsset);
                    return;
                }
            }
            if (s2.equals("image")) {
                this.mInImage = true;
                final ArrayList<TMXTileSet> tmxTileSets = this.mTMXTiledMap.getTMXTileSets();
                tmxTileSets.get(-1 + tmxTileSets.size()).setImageSource(this.mContext, this.mTextureManager, attributes);
                return;
            }
            if (s2.equals("tile")) {
                this.mInTile = true;
                if (this.mInTileset) {
                    this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(attributes, "id");
                    return;
                }
                if (this.mInData) {
                    final ArrayList<TMXLayer> tmxLayers = this.mTMXTiledMap.getTMXLayers();
                    tmxLayers.get(-1 + tmxLayers.size()).initializeTMXTileFromXML(attributes, this.mTMXTilePropertyListener);
                }
            }
            else {
                if (s2.equals("properties")) {
                    this.mInProperties = true;
                    return;
                }
                if (this.mInProperties && s2.equals("property")) {
                    this.mInProperty = true;
                    if (this.mInTile) {
                        final ArrayList<TMXTileSet> tmxTileSets2 = this.mTMXTiledMap.getTMXTileSets();
                        tmxTileSets2.get(-1 + tmxTileSets2.size()).addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(attributes));
                        return;
                    }
                    if (this.mInLayer) {
                        final ArrayList<TMXLayer> tmxLayers2 = this.mTMXTiledMap.getTMXLayers();
                        tmxLayers2.get(-1 + tmxLayers2.size()).addTMXLayerProperty(new TMXLayerProperty(attributes));
                        return;
                    }
                    if (this.mInObject) {
                        final ArrayList<TMXObjectGroup> tmxObjectGroups = this.mTMXTiledMap.getTMXObjectGroups();
                        final ArrayList<TMXObject> tmxObjects = tmxObjectGroups.get(-1 + tmxObjectGroups.size()).getTMXObjects();
                        tmxObjects.get(-1 + tmxObjects.size()).addTMXObjectProperty(new TMXObjectProperty(attributes));
                        return;
                    }
                    if (this.mInObjectGroup) {
                        final ArrayList<TMXObjectGroup> tmxObjectGroups2 = this.mTMXTiledMap.getTMXObjectGroups();
                        tmxObjectGroups2.get(-1 + tmxObjectGroups2.size()).addTMXObjectGroupProperty(new TMXObjectGroupProperty(attributes));
                        return;
                    }
                    if (this.mInMap) {
                        this.mTMXTiledMap.addTMXTiledMapProperty(new TMXTiledMapProperty(attributes));
                    }
                }
                else {
                    if (s2.equals("layer")) {
                        this.mInLayer = true;
                        this.mTMXTiledMap.addTMXLayer(new TMXLayer(this.mTMXTiledMap, attributes));
                        return;
                    }
                    if (s2.equals("data")) {
                        this.mInData = true;
                        this.mDataEncoding = attributes.getValue("", "encoding");
                        this.mDataCompression = attributes.getValue("", "compression");
                        return;
                    }
                    if (s2.equals("objectgroup")) {
                        this.mInObjectGroup = true;
                        this.mTMXTiledMap.addTMXObjectGroup(new TMXObjectGroup(attributes));
                        return;
                    }
                    if (s2.equals("object")) {
                        this.mInObject = true;
                        final ArrayList<TMXObjectGroup> tmxObjectGroups3 = this.mTMXTiledMap.getTMXObjectGroups();
                        tmxObjectGroups3.get(-1 + tmxObjectGroups3.size()).addTMXObject(new TMXObject(attributes));
                        return;
                    }
                    throw new TMXParseException("Unexpected start tag: '" + s2 + "'.");
                }
            }
        }
    }
}
