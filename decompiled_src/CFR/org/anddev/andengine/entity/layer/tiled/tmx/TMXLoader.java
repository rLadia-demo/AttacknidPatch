/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.content.res.AssetManager
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import android.content.res.AssetManager;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLayer;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXParser;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTile;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMap;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class TMXLoader {
    private final Context mContext;
    private final ITMXTilePropertiesListener mTMXTilePropertyListener;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;

    public TMXLoader(Context context, TextureManager textureManager) {
        this(context, textureManager, TextureOptions.DEFAULT);
    }

    public TMXLoader(Context context, TextureManager textureManager, ITMXTilePropertiesListener iTMXTilePropertiesListener) {
        this(context, textureManager, TextureOptions.DEFAULT, iTMXTilePropertiesListener);
    }

    public TMXLoader(Context context, TextureManager textureManager, TextureOptions textureOptions) {
        this(context, textureManager, textureOptions, null);
    }

    public TMXLoader(Context context, TextureManager textureManager, TextureOptions textureOptions, ITMXTilePropertiesListener iTMXTilePropertiesListener) {
        this.mContext = context;
        this.mTextureManager = textureManager;
        this.mTextureOptions = textureOptions;
        this.mTMXTilePropertyListener = iTMXTilePropertiesListener;
    }

    public TMXTiledMap load(InputStream inputStream) throws TMXLoadException {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            TMXParser tMXParser = new TMXParser(this.mContext, this.mTextureManager, this.mTextureOptions, this.mTMXTilePropertyListener);
            xMLReader.setContentHandler(tMXParser);
            xMLReader.parse(new InputSource(new BufferedInputStream(inputStream)));
            TMXTiledMap tMXTiledMap = tMXParser.getTMXTiledMap();
            return tMXTiledMap;
        }
        catch (SAXException var4_5) {
            throw new TMXLoadException(var4_5);
        }
        catch (ParserConfigurationException var3_6) {
            return null;
        }
        catch (IOException var2_7) {
            throw new TMXLoadException(var2_7);
        }
    }

    public TMXTiledMap loadFromAsset(Context context, String string) throws TMXLoadException {
        try {
            TMXTiledMap tMXTiledMap = this.load(context.getAssets().open(string));
            return tMXTiledMap;
        }
        catch (IOException var3_4) {
            throw new TMXLoadException("Could not load TMXTiledMap from asset: " + string, var3_4);
        }
    }

    public interface ITMXTilePropertiesListener {
        public void onTMXTileWithPropertiesCreated(TMXTiledMap var1, TMXLayer var2, TMXTile var3, TMXProperties<TMXTileProperty> var4);
    }

}

