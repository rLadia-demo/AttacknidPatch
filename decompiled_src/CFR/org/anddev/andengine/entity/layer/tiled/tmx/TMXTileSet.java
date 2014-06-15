/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.graphics.Color
 *  android.util.SparseArray
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import android.graphics.Color;
import android.util.SparseArray;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXParseException;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureFactory;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.AssetTextureSource;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.ColorKeyTextureSourceDecorator;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXTileSet
implements TMXConstants {
    private final int mFirstGlobalTileID;
    private String mImageSource;
    private final int mMargin;
    private final String mName;
    private final int mSpacing;
    private final SparseArray<TMXProperties<TMXTileProperty>> mTMXTileProperties = new SparseArray();
    private Texture mTexture;
    private final TextureOptions mTextureOptions;
    private final int mTileHeight;
    private final int mTileWidth;
    private int mTilesHorizontal;
    private int mTilesVertical;

    TMXTileSet(int n, Attributes attributes, TextureOptions textureOptions) {
        this.mFirstGlobalTileID = SAXUtils.getIntAttribute(attributes, "firstgid", 1);
        this.mName = attributes.getValue("", "name");
        this.mTileWidth = SAXUtils.getIntAttributeOrThrow(attributes, "tilewidth");
        this.mTileHeight = SAXUtils.getIntAttributeOrThrow(attributes, "tileheight");
        this.mSpacing = SAXUtils.getIntAttribute(attributes, "spacing", 0);
        this.mMargin = SAXUtils.getIntAttribute(attributes, "margin", 0);
        this.mTextureOptions = textureOptions;
    }

    TMXTileSet(Attributes attributes, TextureOptions textureOptions) {
        this(SAXUtils.getIntAttribute(attributes, "firstgid", 1), attributes, textureOptions);
    }

    private static int determineCount(int n, int n2, int n3, int n4) {
        int n5 = 0;
        int n6 = n - n3 * 2;
        while (n6 > 0) {
            n6 = n6 - n2 - n4;
            ++n5;
        }
        return n5;
    }

    public void addTMXTileProperty(int n, TMXTileProperty tMXTileProperty) {
        TMXProperties tMXProperties = (TMXProperties)this.mTMXTileProperties.get(n);
        if (tMXProperties != null) {
            tMXProperties.add((Object)tMXTileProperty);
            return;
        }
        TMXProperties tMXProperties2 = new TMXProperties();
        tMXProperties2.add((Object)tMXTileProperty);
        this.mTMXTileProperties.put(n, (Object)tMXProperties2);
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

    public TMXProperties<TMXTileProperty> getTMXTilePropertiesFromGlobalTileID(int n) {
        int n2 = n - this.mFirstGlobalTileID;
        return (TMXProperties)this.mTMXTileProperties.get(n2);
    }

    public Texture getTexture() {
        return this.mTexture;
    }

    public TextureRegion getTextureRegionFromGlobalTileID(int n) {
        int n2 = n - this.mFirstGlobalTileID;
        int n3 = n2 % this.mTilesHorizontal;
        int n4 = n2 / this.mTilesHorizontal;
        int n5 = this.mMargin + n3 * (this.mSpacing + this.mTileWidth);
        int n6 = this.mMargin + n4 * (this.mSpacing + this.mTileHeight);
        return new TextureRegion(this.mTexture, n5, n6, this.mTileWidth, this.mTileHeight);
    }

    public final int getTileHeight() {
        return this.mTileHeight;
    }

    public final int getTileWidth() {
        return this.mTileWidth;
    }

    /*
     * Loose catch block
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void setImageSource(Context context, TextureManager textureManager, Attributes attributes) throws TMXParseException {
        this.mImageSource = attributes.getValue("", "source");
        AssetTextureSource assetTextureSource = new AssetTextureSource(context, this.mImageSource);
        this.mTilesHorizontal = TMXTileSet.determineCount(assetTextureSource.getWidth(), this.mTileWidth, this.mMargin, this.mSpacing);
        this.mTilesVertical = TMXTileSet.determineCount(assetTextureSource.getHeight(), this.mTileHeight, this.mMargin, this.mSpacing);
        this.mTexture = TextureFactory.createForTextureSourceSize(assetTextureSource, this.mTextureOptions);
        String string = SAXUtils.getAttribute(attributes, "trans", null);
        if (string == null) {
            TextureRegionFactory.createFromSource(this.mTexture, assetTextureSource, 0, 0);
        } else {
            String string2;
            String string3 = string.startsWith("#") ? string : (string2 = "#" + string);
            int n = Color.parseColor((String)string3);
            TextureRegionFactory.createFromSource(this.mTexture, new ColorKeyTextureSourceDecorator(assetTextureSource, n), 0, 0);
        }
        textureManager.loadTexture(this.mTexture);
        return;
        catch (IllegalArgumentException illegalArgumentException) {
            throw new TMXParseException("Illegal value: '" + string + "' for attribute 'trans' supplied!", illegalArgumentException);
        }
    }
}

