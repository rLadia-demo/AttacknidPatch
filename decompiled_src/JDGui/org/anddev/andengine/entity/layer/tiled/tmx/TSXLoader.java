package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import android.content.res.AssetManager;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TSXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class TSXLoader
{
  private final Context mContext;
  private final TextureManager mTextureManager;
  private final TextureOptions mTextureOptions;
  
  public TSXLoader(Context paramContext, TextureManager paramTextureManager, TextureOptions paramTextureOptions)
  {
    this.mContext = paramContext;
    this.mTextureManager = paramTextureManager;
    this.mTextureOptions = paramTextureOptions;
  }
  
  private TMXTileSet load(int paramInt, InputStream paramInputStream)
    throws TSXLoadException
  {
    try
    {
      XMLReader localXMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
      TSXParser localTSXParser = new TSXParser(this.mContext, this.mTextureManager, this.mTextureOptions, paramInt);
      localXMLReader.setContentHandler(localTSXParser);
      localXMLReader.parse(new InputSource(new BufferedInputStream(paramInputStream)));
      TMXTileSet localTMXTileSet = localTSXParser.getTMXTileSet();
      return localTMXTileSet;
    }
    catch (SAXException localSAXException)
    {
      throw new TSXLoadException(localSAXException);
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      return null;
    }
    catch (IOException localIOException)
    {
      throw new TSXLoadException(localIOException);
    }
  }
  
  public TMXTileSet loadFromAsset(Context paramContext, int paramInt, String paramString)
    throws TSXLoadException
  {
    try
    {
      TMXTileSet localTMXTileSet = load(paramInt, paramContext.getAssets().open(paramString));
      return localTMXTileSet;
    }
    catch (IOException localIOException)
    {
      throw new TSXLoadException("Could not load TMXTileSet from asset: " + paramString, localIOException);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TSXLoader
 * JD-Core Version:    0.7.0.1
 */