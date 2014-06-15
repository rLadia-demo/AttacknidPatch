package org.anddev.andengine.entity.layer.tiled.tmx;

import org.xml.sax.helpers.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;

public class TSXParser extends DefaultHandler implements TMXConstants
{
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
    
    public TSXParser(final Context mContext, final TextureManager mTextureManager, final TextureOptions mTextureOptions, final int mFirstGlobalTileID) {
        super();
        this.mContext = mContext;
        this.mTextureManager = mTextureManager;
        this.mTextureOptions = mTextureOptions;
        this.mFirstGlobalTileID = mFirstGlobalTileID;
    }
    
    @Override
    public void endElement(final String s, final String s2, final String s3) throws SAXException {
        if (s2.equals("tileset")) {
            this.mInTileset = false;
            return;
        }
        if (s2.equals("image")) {
            this.mInImage = false;
            return;
        }
        if (s2.equals("tile")) {
            this.mInTile = false;
            return;
        }
        if (s2.equals("properties")) {
            this.mInProperties = false;
            return;
        }
        if (s2.equals("property")) {
            this.mInProperty = false;
            return;
        }
        throw new TMXParseException("Unexpected end tag: '" + s2 + "'.");
    }
    
    TMXTileSet getTMXTileSet() {
        return this.mTMXTileSet;
    }
    
    @Override
    public void startElement(final String s, final String s2, final String s3, final Attributes attributes) throws SAXException {
        if (s2.equals("tileset")) {
            this.mInTileset = true;
            this.mTMXTileSet = new TMXTileSet(this.mFirstGlobalTileID, attributes, this.mTextureOptions);
            return;
        }
        if (s2.equals("image")) {
            this.mInImage = true;
            this.mTMXTileSet.setImageSource(this.mContext, this.mTextureManager, attributes);
            return;
        }
        if (s2.equals("tile")) {
            this.mInTile = true;
            this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(attributes, "id");
            return;
        }
        if (s2.equals("properties")) {
            this.mInProperties = true;
            return;
        }
        if (s2.equals("property")) {
            this.mInProperty = true;
            this.mTMXTileSet.addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(attributes));
            return;
        }
        throw new TMXParseException("Unexpected start tag: '" + s2 + "'.");
    }
}
