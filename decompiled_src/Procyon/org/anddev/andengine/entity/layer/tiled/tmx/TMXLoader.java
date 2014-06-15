package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.*;
import javax.xml.parsers.*;
import java.io.*;
import org.xml.sax.*;

public class TMXLoader
{
    private final Context mContext;
    private final ITMXTilePropertiesListener mTMXTilePropertyListener;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;
    
    public TMXLoader(final Context context, final TextureManager textureManager) {
        this(context, textureManager, TextureOptions.DEFAULT);
    }
    
    public TMXLoader(final Context context, final TextureManager textureManager, final ITMXTilePropertiesListener itmxTilePropertiesListener) {
        this(context, textureManager, TextureOptions.DEFAULT, itmxTilePropertiesListener);
    }
    
    public TMXLoader(final Context context, final TextureManager textureManager, final TextureOptions textureOptions) {
        this(context, textureManager, textureOptions, null);
    }
    
    public TMXLoader(final Context mContext, final TextureManager mTextureManager, final TextureOptions mTextureOptions, final ITMXTilePropertiesListener mtmxTilePropertyListener) {
        super();
        this.mContext = mContext;
        this.mTextureManager = mTextureManager;
        this.mTextureOptions = mTextureOptions;
        this.mTMXTilePropertyListener = mtmxTilePropertyListener;
    }
    
    public TMXTiledMap load(final InputStream inputStream) throws TMXLoadException {
        try {
            final XMLReader xmlReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            final TMXParser contentHandler = new TMXParser(this.mContext, this.mTextureManager, this.mTextureOptions, this.mTMXTilePropertyListener);
            xmlReader.setContentHandler(contentHandler);
            xmlReader.parse(new InputSource(new BufferedInputStream(inputStream)));
            return contentHandler.getTMXTiledMap();
        }
        catch (SAXException ex) {
            throw new TMXLoadException(ex);
        }
        catch (ParserConfigurationException ex3) {
            return null;
        }
        catch (IOException ex2) {
            throw new TMXLoadException(ex2);
        }
    }
    
    public TMXTiledMap loadFromAsset(final Context context, final String s) throws TMXLoadException {
        try {
            return this.load(context.getAssets().open(s));
        }
        catch (IOException ex) {
            throw new TMXLoadException("Could not load TMXTiledMap from asset: " + s, ex);
        }
    }
    
    public interface ITMXTilePropertiesListener
    {
        void onTMXTileWithPropertiesCreated(TMXTiledMap p0, TMXLayer p1, TMXTile p2, TMXProperties<TMXTileProperty> p3);
    }
}
