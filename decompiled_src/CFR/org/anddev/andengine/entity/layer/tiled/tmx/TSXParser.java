/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileSet;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXParseException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class TSXParser
extends DefaultHandler
implements TMXConstants {
    private final Context mContext;
    private final int mFirstGlobalTileID;
    private boolean mInImage;
    private boolean mInProperties;
    private boolean mInProperty;
    private boolean mInTile;
    private boolean mInTileset;
    private int mLastTileSetTileID;
    private TMXTileSet mTMXTileSet;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;

    public TSXParser(Context context, TextureManager textureManager, TextureOptions textureOptions, int n) {
        this.mContext = context;
        this.mTextureManager = textureManager;
        this.mTextureOptions = textureOptions;
        this.mFirstGlobalTileID = n;
    }

    @Override
    public void endElement(String string3, String string2, String string3) throws SAXException {
        if (string2.equals("tileset")) {
            this.mInTileset = false;
            return;
        }
        if (string2.equals("image")) {
            this.mInImage = false;
            return;
        }
        if (string2.equals("tile")) {
            this.mInTile = false;
            return;
        }
        if (string2.equals("properties")) {
            this.mInProperties = false;
            return;
        }
        if (!string2.equals("property")) throw new TMXParseException("Unexpected end tag: '" + string2 + "'.");
        this.mInProperty = false;
    }

    TMXTileSet getTMXTileSet() {
        return this.mTMXTileSet;
    }

    @Override
    public void startElement(String string3, String string2, String string3, Attributes attributes) throws SAXException {
        if (string2.equals("tileset")) {
            this.mInTileset = true;
            this.mTMXTileSet = new TMXTileSet(this.mFirstGlobalTileID, attributes, this.mTextureOptions);
            return;
        }
        if (string2.equals("image")) {
            this.mInImage = true;
            this.mTMXTileSet.setImageSource(this.mContext, this.mTextureManager, attributes);
            return;
        }
        if (string2.equals("tile")) {
            this.mInTile = true;
            this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(attributes, "id");
            return;
        }
        if (string2.equals("properties")) {
            this.mInProperties = true;
            return;
        }
        if (!string2.equals("property")) throw new TMXParseException("Unexpected start tag: '" + string2 + "'.");
        this.mInProperty = true;
        this.mTMXTileSet.addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(attributes));
    }
}

