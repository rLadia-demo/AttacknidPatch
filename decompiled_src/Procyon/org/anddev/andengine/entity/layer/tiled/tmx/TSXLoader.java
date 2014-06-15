package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.*;
import javax.xml.parsers.*;
import java.io.*;
import org.xml.sax.*;

public class TSXLoader
{
    private final Context mContext;
    private final TextureManager mTextureManager;
    private final TextureOptions mTextureOptions;
    
    public TSXLoader(final Context mContext, final TextureManager mTextureManager, final TextureOptions mTextureOptions) {
        super();
        this.mContext = mContext;
        this.mTextureManager = mTextureManager;
        this.mTextureOptions = mTextureOptions;
    }
    
    private TMXTileSet load(final int n, final InputStream inputStream) throws TSXLoadException {
        try {
            final XMLReader xmlReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            final TSXParser contentHandler = new TSXParser(this.mContext, this.mTextureManager, this.mTextureOptions, n);
            xmlReader.setContentHandler(contentHandler);
            xmlReader.parse(new InputSource(new BufferedInputStream(inputStream)));
            return contentHandler.getTMXTileSet();
        }
        catch (SAXException ex) {
            throw new TSXLoadException(ex);
        }
        catch (ParserConfigurationException ex3) {
            return null;
        }
        catch (IOException ex2) {
            throw new TSXLoadException(ex2);
        }
    }
    
    public TMXTileSet loadFromAsset(final Context context, final int n, final String s) throws TSXLoadException {
        try {
            return this.load(n, context.getAssets().open(s));
        }
        catch (IOException ex) {
            throw new TSXLoadException("Could not load TMXTileSet from asset: " + s, ex);
        }
    }
}
