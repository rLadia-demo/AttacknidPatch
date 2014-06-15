package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import android.content.res.AssetManager;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class TMXLoader
{
  private final Context mContext;
  private final ITMXTilePropertiesListener mTMXTilePropertyListener;
  private final TextureManager mTextureManager;
  private final TextureOptions mTextureOptions;
  
  public TMXLoader(Context paramContext, TextureManager paramTextureManager)
  {
    this(paramContext, paramTextureManager, TextureOptions.DEFAULT);
  }
  
  public TMXLoader(Context paramContext, TextureManager paramTextureManager, ITMXTilePropertiesListener paramITMXTilePropertiesListener)
  {
    this(paramContext, paramTextureManager, TextureOptions.DEFAULT, paramITMXTilePropertiesListener);
  }
  
  public TMXLoader(Context paramContext, TextureManager paramTextureManager, TextureOptions paramTextureOptions)
  {
    this(paramContext, paramTextureManager, paramTextureOptions, null);
  }
  
  public TMXLoader(Context paramContext, TextureManager paramTextureManager, TextureOptions paramTextureOptions, ITMXTilePropertiesListener paramITMXTilePropertiesListener)
  {
    this.mContext = paramContext;
    this.mTextureManager = paramTextureManager;
    this.mTextureOptions = paramTextureOptions;
    this.mTMXTilePropertyListener = paramITMXTilePropertiesListener;
  }
  
  public TMXTiledMap load(InputStream paramInputStream)
    throws TMXLoadException
  {
    try
    {
      XMLReader localXMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
      TMXParser localTMXParser = new TMXParser(this.mContext, this.mTextureManager, this.mTextureOptions, this.mTMXTilePropertyListener);
      localXMLReader.setContentHandler(localTMXParser);
      localXMLReader.parse(new InputSource(new BufferedInputStream(paramInputStream)));
      TMXTiledMap localTMXTiledMap = localTMXParser.getTMXTiledMap();
      return localTMXTiledMap;
    }
    catch (SAXException localSAXException)
    {
      throw new TMXLoadException(localSAXException);
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      return null;
    }
    catch (IOException localIOException)
    {
      throw new TMXLoadException(localIOException);
    }
  }
  
  public TMXTiledMap loadFromAsset(Context paramContext, String paramString)
    throws TMXLoadException
  {
    try
    {
      TMXTiledMap localTMXTiledMap = load(paramContext.getAssets().open(paramString));
      return localTMXTiledMap;
    }
    catch (IOException localIOException)
    {
      throw new TMXLoadException("Could not load TMXTiledMap from asset: " + paramString, localIOException);
    }
  }
  
  public static abstract interface ITMXTilePropertiesListener
  {
    public abstract void onTMXTileWithPropertiesCreated(TMXTiledMap paramTMXTiledMap, TMXLayer paramTMXLayer, TMXTile paramTMXTile, TMXProperties<TMXTileProperty> paramTMXProperties);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXLoader
 * JD-Core Version:    0.7.0.1
 */