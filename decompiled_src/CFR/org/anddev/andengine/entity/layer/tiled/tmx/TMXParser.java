/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import java.io.IOException;
import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLayer;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLayerProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLoader;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObject;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectGroup;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectGroupProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXObjectProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileSet;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMap;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMapProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TSXLoader;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXParseException;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TSXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class TMXParser
extends DefaultHandler
implements TMXConstants {
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
    private final StringBuilder mStringBuilder = new StringBuilder();
    private final TMXLoader.ITMXTilePropertiesListener mTMXTilePropertyListener;
    private TMXTiledMap mTMXTiledMap;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;

    public TMXParser(Context context, TextureManager textureManager, TextureOptions textureOptions, TMXLoader.ITMXTilePropertiesListener iTMXTilePropertiesListener) {
        this.mContext = context;
        this.mTextureManager = textureManager;
        this.mTextureOptions = textureOptions;
        this.mTMXTilePropertyListener = iTMXTilePropertiesListener;
    }

    @Override
    public void characters(char[] arrc, int n, int n2) throws SAXException {
        this.mStringBuilder.append(arrc, n, n2);
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void endElement(String string3, String string2, String string3) throws SAXException {
        if (string2.equals("map")) {
            this.mInMap = false;
        } else if (string2.equals("tileset")) {
            this.mInTileset = false;
        } else if (string2.equals("image")) {
            this.mInImage = false;
        } else if (string2.equals("tile")) {
            this.mInTile = false;
        } else if (string2.equals("properties")) {
            this.mInProperties = false;
        } else if (string2.equals("property")) {
            this.mInProperty = false;
        } else if (string2.equals("layer")) {
            this.mInLayer = false;
        } else if (string2.equals("data")) {
            boolean bl = this.mDataCompression != null && this.mDataEncoding != null;
            if (bl) {
                ArrayList<TMXLayer> arrayList = this.mTMXTiledMap.getTMXLayers();
                try {
                    arrayList.get(-1 + arrayList.size()).initializeTMXTilesFromDataString(this.mStringBuilder.toString().trim(), this.mDataEncoding, this.mDataCompression, this.mTMXTilePropertyListener);
                }
                catch (IOException var6_4) {
                    Debug.e(var6_4);
                }
                this.mDataCompression = null;
                this.mDataEncoding = null;
            }
            this.mInData = false;
        } else if (string2.equals("objectgroup")) {
            this.mInObjectGroup = false;
        } else {
            if (!string2.equals("object")) throw new TMXParseException("Unexpected end tag: '" + string2 + "'.");
            this.mInObject = false;
        }
        this.mStringBuilder.setLength(0);
    }

    TMXTiledMap getTMXTiledMap() {
        return this.mTMXTiledMap;
    }

    /*
     * Loose catch block
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void startElement(String string32, String string2, String string32, Attributes attributes) throws SAXException {
        if (string2.equals("map")) {
            this.mInMap = true;
            this.mTMXTiledMap = new TMXTiledMap(attributes);
            return;
        }
        if (string2.equals("tileset")) {
            String string4;
            TMXTileSet tMXTileSet;
            this.mInTileset = true;
            if ((string4 = attributes.getValue("", "source")) == null) {
                tMXTileSet = new TMXTileSet(attributes, this.mTextureOptions);
            } else {
                TMXTileSet tMXTileSet2;
                int n = SAXUtils.getIntAttribute(attributes, "firstgid", 1);
                tMXTileSet = tMXTileSet2 = new TSXLoader(this.mContext, this.mTextureManager, this.mTextureOptions).loadFromAsset(this.mContext, n, string4);
            }
            this.mTMXTiledMap.addTMXTileSet(tMXTileSet);
            return;
            catch (TSXLoadException tSXLoadException) {
                throw new TMXParseException("Failed to load TMXTileSet from source: " + string4, tSXLoadException);
            }
        }
        if (string2.equals("image")) {
            this.mInImage = true;
            ArrayList<TMXTileSet> arrayList = this.mTMXTiledMap.getTMXTileSets();
            arrayList.get(-1 + arrayList.size()).setImageSource(this.mContext, this.mTextureManager, attributes);
            return;
        }
        if (string2.equals("tile")) {
            this.mInTile = true;
            if (this.mInTileset) {
                this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(attributes, "id");
                return;
            }
            if (!this.mInData) return;
            ArrayList<TMXLayer> arrayList = this.mTMXTiledMap.getTMXLayers();
            arrayList.get(-1 + arrayList.size()).initializeTMXTileFromXML(attributes, this.mTMXTilePropertyListener);
            return;
        }
        if (string2.equals("properties")) {
            this.mInProperties = true;
            return;
        }
        if (this.mInProperties && string2.equals("property")) {
            this.mInProperty = true;
            if (this.mInTile) {
                ArrayList<TMXTileSet> arrayList = this.mTMXTiledMap.getTMXTileSets();
                arrayList.get(-1 + arrayList.size()).addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(attributes));
                return;
            }
            if (this.mInLayer) {
                ArrayList<TMXLayer> arrayList = this.mTMXTiledMap.getTMXLayers();
                arrayList.get(-1 + arrayList.size()).addTMXLayerProperty(new TMXLayerProperty(attributes));
                return;
            }
            if (this.mInObject) {
                ArrayList<TMXObjectGroup> arrayList = this.mTMXTiledMap.getTMXObjectGroups();
                ArrayList<TMXObject> arrayList2 = arrayList.get(-1 + arrayList.size()).getTMXObjects();
                arrayList2.get(-1 + arrayList2.size()).addTMXObjectProperty(new TMXObjectProperty(attributes));
                return;
            }
            if (this.mInObjectGroup) {
                ArrayList<TMXObjectGroup> arrayList = this.mTMXTiledMap.getTMXObjectGroups();
                arrayList.get(-1 + arrayList.size()).addTMXObjectGroupProperty(new TMXObjectGroupProperty(attributes));
                return;
            }
            if (!this.mInMap) return;
            this.mTMXTiledMap.addTMXTiledMapProperty(new TMXTiledMapProperty(attributes));
            return;
        }
        if (string2.equals("layer")) {
            this.mInLayer = true;
            this.mTMXTiledMap.addTMXLayer(new TMXLayer(this.mTMXTiledMap, attributes));
            return;
        }
        if (string2.equals("data")) {
            this.mInData = true;
            this.mDataEncoding = attributes.getValue("", "encoding");
            this.mDataCompression = attributes.getValue("", "compression");
            return;
        }
        if (string2.equals("objectgroup")) {
            this.mInObjectGroup = true;
            this.mTMXTiledMap.addTMXObjectGroup(new TMXObjectGroup(attributes));
            return;
        }
        if (!string2.equals("object")) throw new TMXParseException("Unexpected start tag: '" + string2 + "'.");
        this.mInObject = true;
        ArrayList<TMXObjectGroup> arrayList = this.mTMXTiledMap.getTMXObjectGroups();
        arrayList.get(-1 + arrayList.size()).addTMXObject(new TMXObject(attributes));
    }
}

