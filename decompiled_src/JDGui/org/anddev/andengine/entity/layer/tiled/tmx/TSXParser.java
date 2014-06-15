package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
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
  implements TMXConstants
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
  
  public TSXParser(Context paramContext, TextureManager paramTextureManager, TextureOptions paramTextureOptions, int paramInt)
  {
    this.mContext = paramContext;
    this.mTextureManager = paramTextureManager;
    this.mTextureOptions = paramTextureOptions;
    this.mFirstGlobalTileID = paramInt;
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString2.equals("tileset"))
    {
      this.mInTileset = false;
      return;
    }
    if (paramString2.equals("image"))
    {
      this.mInImage = false;
      return;
    }
    if (paramString2.equals("tile"))
    {
      this.mInTile = false;
      return;
    }
    if (paramString2.equals("properties"))
    {
      this.mInProperties = false;
      return;
    }
    if (paramString2.equals("property"))
    {
      this.mInProperty = false;
      return;
    }
    throw new TMXParseException("Unexpected end tag: '" + paramString2 + "'.");
  }
  
  TMXTileSet getTMXTileSet()
  {
    return this.mTMXTileSet;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString2.equals("tileset"))
    {
      this.mInTileset = true;
      this.mTMXTileSet = new TMXTileSet(this.mFirstGlobalTileID, paramAttributes, this.mTextureOptions);
      return;
    }
    if (paramString2.equals("image"))
    {
      this.mInImage = true;
      this.mTMXTileSet.setImageSource(this.mContext, this.mTextureManager, paramAttributes);
      return;
    }
    if (paramString2.equals("tile"))
    {
      this.mInTile = true;
      this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(paramAttributes, "id");
      return;
    }
    if (paramString2.equals("properties"))
    {
      this.mInProperties = true;
      return;
    }
    if (paramString2.equals("property"))
    {
      this.mInProperty = true;
      this.mTMXTileSet.addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(paramAttributes));
      return;
    }
    throw new TMXParseException("Unexpected start tag: '" + paramString2 + "'.");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TSXParser
 * JD-Core Version:    0.7.0.1
 */