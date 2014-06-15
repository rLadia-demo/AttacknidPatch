package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import java.io.IOException;
import java.util.ArrayList;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXParseException;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TSXLoadException;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class TMXParser
  extends DefaultHandler
  implements TMXConstants
{
  private final Context mContext;
  private String mDataCompression;
  private String mDataEncoding;
  private boolean mInData;
  private boolean mInImage;
  private boolean mInLayer;
  private boolean mInMap;
  private boolean mInObject;
  private boolean mInObjectGroup;
  private boolean mInProperties;
  private boolean mInProperty;
  private boolean mInTile;
  private boolean mInTileset;
  private int mLastTileSetTileID;
  private final StringBuilder mStringBuilder = new StringBuilder();
  private final TMXLoader.ITMXTilePropertiesListener mTMXTilePropertyListener;
  private TMXTiledMap mTMXTiledMap;
  private final TextureManager mTextureManager;
  private final TextureOptions mTextureOptions;
  
  public TMXParser(Context paramContext, TextureManager paramTextureManager, TextureOptions paramTextureOptions, TMXLoader.ITMXTilePropertiesListener paramITMXTilePropertiesListener)
  {
    this.mContext = paramContext;
    this.mTextureManager = paramTextureManager;
    this.mTextureOptions = paramTextureOptions;
    this.mTMXTilePropertyListener = paramITMXTilePropertiesListener;
  }
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    this.mStringBuilder.append(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    if (paramString2.equals("map")) {
      this.mInMap = false;
    }
    for (;;)
    {
      this.mStringBuilder.setLength(0);
      return;
      if (paramString2.equals("tileset"))
      {
        this.mInTileset = false;
      }
      else if (paramString2.equals("image"))
      {
        this.mInImage = false;
      }
      else if (paramString2.equals("tile"))
      {
        this.mInTile = false;
      }
      else if (paramString2.equals("properties"))
      {
        this.mInProperties = false;
      }
      else if (paramString2.equals("property"))
      {
        this.mInProperty = false;
      }
      else if (paramString2.equals("layer"))
      {
        this.mInLayer = false;
      }
      else if (paramString2.equals("data"))
      {
        int i;
        ArrayList localArrayList;
        if ((this.mDataCompression != null) && (this.mDataEncoding != null))
        {
          i = 1;
          if (i != 0) {
            localArrayList = this.mTMXTiledMap.getTMXLayers();
          }
        }
        try
        {
          ((TMXLayer)localArrayList.get(-1 + localArrayList.size())).initializeTMXTilesFromDataString(this.mStringBuilder.toString().trim(), this.mDataEncoding, this.mDataCompression, this.mTMXTilePropertyListener);
          this.mDataCompression = null;
          this.mDataEncoding = null;
          this.mInData = false;
          continue;
          i = 0;
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            Debug.e(localIOException);
          }
        }
      }
      else if (paramString2.equals("objectgroup"))
      {
        this.mInObjectGroup = false;
      }
      else
      {
        if (!paramString2.equals("object")) {
          break;
        }
        this.mInObject = false;
      }
    }
    throw new TMXParseException("Unexpected end tag: '" + paramString2 + "'.");
  }
  
  TMXTiledMap getTMXTiledMap()
  {
    return this.mTMXTiledMap;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    if (paramString2.equals("map"))
    {
      this.mInMap = true;
      this.mTMXTiledMap = new TMXTiledMap(paramAttributes);
    }
    do
    {
      do
      {
        return;
        if (paramString2.equals("tileset"))
        {
          this.mInTileset = true;
          String str = paramAttributes.getValue("", "source");
          Object localObject;
          if (str == null) {
            localObject = new TMXTileSet(paramAttributes, this.mTextureOptions);
          }
          for (;;)
          {
            this.mTMXTiledMap.addTMXTileSet((TMXTileSet)localObject);
            return;
            try
            {
              int i = SAXUtils.getIntAttribute(paramAttributes, "firstgid", 1);
              TMXTileSet localTMXTileSet = new TSXLoader(this.mContext, this.mTextureManager, this.mTextureOptions).loadFromAsset(this.mContext, i, str);
              localObject = localTMXTileSet;
            }
            catch (TSXLoadException localTSXLoadException)
            {
              throw new TMXParseException("Failed to load TMXTileSet from source: " + str, localTSXLoadException);
            }
          }
        }
        if (paramString2.equals("image"))
        {
          this.mInImage = true;
          ArrayList localArrayList8 = this.mTMXTiledMap.getTMXTileSets();
          ((TMXTileSet)localArrayList8.get(-1 + localArrayList8.size())).setImageSource(this.mContext, this.mTextureManager, paramAttributes);
          return;
        }
        if (!paramString2.equals("tile")) {
          break;
        }
        this.mInTile = true;
        if (this.mInTileset)
        {
          this.mLastTileSetTileID = SAXUtils.getIntAttributeOrThrow(paramAttributes, "id");
          return;
        }
      } while (!this.mInData);
      ArrayList localArrayList7 = this.mTMXTiledMap.getTMXLayers();
      ((TMXLayer)localArrayList7.get(-1 + localArrayList7.size())).initializeTMXTileFromXML(paramAttributes, this.mTMXTilePropertyListener);
      return;
      if (paramString2.equals("properties"))
      {
        this.mInProperties = true;
        return;
      }
      if ((!this.mInProperties) || (!paramString2.equals("property"))) {
        break;
      }
      this.mInProperty = true;
      if (this.mInTile)
      {
        ArrayList localArrayList6 = this.mTMXTiledMap.getTMXTileSets();
        ((TMXTileSet)localArrayList6.get(-1 + localArrayList6.size())).addTMXTileProperty(this.mLastTileSetTileID, new TMXTileProperty(paramAttributes));
        return;
      }
      if (this.mInLayer)
      {
        ArrayList localArrayList5 = this.mTMXTiledMap.getTMXLayers();
        ((TMXLayer)localArrayList5.get(-1 + localArrayList5.size())).addTMXLayerProperty(new TMXLayerProperty(paramAttributes));
        return;
      }
      if (this.mInObject)
      {
        ArrayList localArrayList3 = this.mTMXTiledMap.getTMXObjectGroups();
        ArrayList localArrayList4 = ((TMXObjectGroup)localArrayList3.get(-1 + localArrayList3.size())).getTMXObjects();
        ((TMXObject)localArrayList4.get(-1 + localArrayList4.size())).addTMXObjectProperty(new TMXObjectProperty(paramAttributes));
        return;
      }
      if (this.mInObjectGroup)
      {
        ArrayList localArrayList2 = this.mTMXTiledMap.getTMXObjectGroups();
        ((TMXObjectGroup)localArrayList2.get(-1 + localArrayList2.size())).addTMXObjectGroupProperty(new TMXObjectGroupProperty(paramAttributes));
        return;
      }
    } while (!this.mInMap);
    this.mTMXTiledMap.addTMXTiledMapProperty(new TMXTiledMapProperty(paramAttributes));
    return;
    if (paramString2.equals("layer"))
    {
      this.mInLayer = true;
      this.mTMXTiledMap.addTMXLayer(new TMXLayer(this.mTMXTiledMap, paramAttributes));
      return;
    }
    if (paramString2.equals("data"))
    {
      this.mInData = true;
      this.mDataEncoding = paramAttributes.getValue("", "encoding");
      this.mDataCompression = paramAttributes.getValue("", "compression");
      return;
    }
    if (paramString2.equals("objectgroup"))
    {
      this.mInObjectGroup = true;
      this.mTMXTiledMap.addTMXObjectGroup(new TMXObjectGroup(paramAttributes));
      return;
    }
    if (paramString2.equals("object"))
    {
      this.mInObject = true;
      ArrayList localArrayList1 = this.mTMXTiledMap.getTMXObjectGroups();
      ((TMXObjectGroup)localArrayList1.get(-1 + localArrayList1.size())).addTMXObject(new TMXObject(paramAttributes));
      return;
    }
    throw new TMXParseException("Unexpected start tag: '" + paramString2 + "'.");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXParser
 * JD-Core Version:    0.7.0.1
 */