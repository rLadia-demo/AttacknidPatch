package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import android.util.*;
import org.xml.sax.*;
import org.anddev.andengine.util.*;
import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.opengl.texture.region.*;
import android.graphics.*;
import org.anddev.andengine.opengl.texture.source.decorator.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.*;

public class TMXTileSet implements TMXConstants
{
    private final int mFirstGlobalTileID;
    private String mImageSource;
    private final int mMargin;
    private final String mName;
    private final int mSpacing;
    private final SparseArray<TMXProperties<TMXTileProperty>> mTMXTileProperties;
    private Texture mTexture;
    private final TextureOptions mTextureOptions;
    private final int mTileHeight;
    private final int mTileWidth;
    private int mTilesHorizontal;
    private int mTilesVertical;
    
    TMXTileSet(final int n, final Attributes attributes, final TextureOptions mTextureOptions) {
        super();
        this.mTMXTileProperties = (SparseArray<TMXProperties<TMXTileProperty>>)new SparseArray();
        this.mFirstGlobalTileID = SAXUtils.getIntAttribute(attributes, "firstgid", 1);
        this.mName = attributes.getValue("", "name");
        this.mTileWidth = SAXUtils.getIntAttributeOrThrow(attributes, "tilewidth");
        this.mTileHeight = SAXUtils.getIntAttributeOrThrow(attributes, "tileheight");
        this.mSpacing = SAXUtils.getIntAttribute(attributes, "spacing", 0);
        this.mMargin = SAXUtils.getIntAttribute(attributes, "margin", 0);
        this.mTextureOptions = mTextureOptions;
    }
    
    TMXTileSet(final Attributes attributes, final TextureOptions textureOptions) {
        this(SAXUtils.getIntAttribute(attributes, "firstgid", 1), attributes, textureOptions);
    }
    
    private static int determineCount(final int n, final int n2, final int n3, final int n4) {
        int n5 = 0;
        for (int i = n - n3 * 2; i > 0; i = i - n2 - n4, ++n5) {}
        return n5;
    }
    
    public void addTMXTileProperty(final int n, final TMXTileProperty tmxTileProperty) {
        final TMXProperties tmxProperties = (TMXProperties)this.mTMXTileProperties.get(n);
        if (tmxProperties != null) {
            tmxProperties.add(tmxTileProperty);
            return;
        }
        final TMXProperties<TMXTileProperty> tmxProperties2 = new TMXProperties<TMXTileProperty>();
        tmxProperties2.add(tmxTileProperty);
        this.mTMXTileProperties.put(n, (Object)tmxProperties2);
    }
    
    public final int getFirstGlobalTileID() {
        return this.mFirstGlobalTileID;
    }
    
    public String getImageSource() {
        return this.mImageSource;
    }
    
    public final String getName() {
        return this.mName;
    }
    
    public SparseArray<TMXProperties<TMXTileProperty>> getTMXTileProperties() {
        return this.mTMXTileProperties;
    }
    
    public TMXProperties<TMXTileProperty> getTMXTilePropertiesFromGlobalTileID(final int n) {
        return (TMXProperties<TMXTileProperty>)this.mTMXTileProperties.get(n - this.mFirstGlobalTileID);
    }
    
    public Texture getTexture() {
        return this.mTexture;
    }
    
    public TextureRegion getTextureRegionFromGlobalTileID(final int n) {
        final int n2 = n - this.mFirstGlobalTileID;
        return new TextureRegion(this.mTexture, this.mMargin + n2 % this.mTilesHorizontal * (this.mSpacing + this.mTileWidth), this.mMargin + n2 / this.mTilesHorizontal * (this.mSpacing + this.mTileHeight), this.mTileWidth, this.mTileHeight);
    }
    
    public final int getTileHeight() {
        return this.mTileHeight;
    }
    
    public final int getTileWidth() {
        return this.mTileWidth;
    }
    
    public void setImageSource(final Context context, final TextureManager textureManager, final Attributes attributes) throws TMXParseException {
        this.mImageSource = attributes.getValue("", "source");
        final AssetTextureSource assetTextureSource = new AssetTextureSource(context, this.mImageSource);
        this.mTilesHorizontal = determineCount(assetTextureSource.getWidth(), this.mTileWidth, this.mMargin, this.mSpacing);
        this.mTilesVertical = determineCount(assetTextureSource.getHeight(), this.mTileHeight, this.mMargin, this.mSpacing);
        this.mTexture = TextureFactory.createForTextureSourceSize(assetTextureSource, this.mTextureOptions);
        final String attribute = SAXUtils.getAttribute(attributes, "trans", null);
        if (attribute == null) {
            TextureRegionFactory.createFromSource(this.mTexture, assetTextureSource, 0, 0);
        }
        else {
            while (true) {
                while (true) {
                    try {
                        if (attribute.startsWith("#")) {
                            final String string = attribute;
                            TextureRegionFactory.createFromSource(this.mTexture, new ColorKeyTextureSourceDecorator(assetTextureSource, Color.parseColor(string)), 0, 0);
                            break;
                        }
                    }
                    catch (IllegalArgumentException ex) {
                        throw new TMXParseException("Illegal value: '" + attribute + "' for attribute 'trans' supplied!", ex);
                    }
                    final String string = "#" + attribute;
                    continue;
                }
            }
        }
        textureManager.loadTexture(this.mTexture);
    }
}
