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
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileSet;
import org.anddev.andengine.entity.layer.tiled.tmx.TSXParser;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TSXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class TSXLoader {
    private final Context mContext;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;

    public TSXLoader(Context context, TextureManager textureManager, TextureOptions textureOptions) {
        this.mContext = context;
        this.mTextureManager = textureManager;
        this.mTextureOptions = textureOptions;
    }

    private TMXTileSet load(int n, InputStream inputStream) throws TSXLoadException {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            TSXParser tSXParser = new TSXParser(this.mContext, this.mTextureManager, this.mTextureOptions, n);
            xMLReader.setContentHandler(tSXParser);
            xMLReader.parse(new InputSource(new BufferedInputStream(inputStream)));
            TMXTileSet tMXTileSet = tSXParser.getTMXTileSet();
            return tMXTileSet;
        }
        catch (SAXException var5_6) {
            throw new TSXLoadException(var5_6);
        }
        catch (ParserConfigurationException var4_7) {
            return null;
        }
        catch (IOException var3_8) {
            throw new TSXLoadException(var3_8);
        }
    }

    public TMXTileSet loadFromAsset(Context context, int n, String string) throws TSXLoadException {
        try {
            TMXTileSet tMXTileSet = this.load(n, context.getAssets().open(string));
            return tMXTileSet;
        }
        catch (IOException var4_5) {
            throw new TSXLoadException("Could not load TMXTileSet from asset: " + string, var4_5);
        }
    }
}

