package org.anddev.andengine.entity.layer.tiled.tmx;

import android.content.Context;
import android.graphics.Color;
import android.util.SparseArray;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXParseException;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureFactory;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.source.AssetTextureSource;
import org.anddev.andengine.opengl.texture.source.decorator.ColorKeyTextureSourceDecorator;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXTileSet
  implements TMXConstants
{
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
  
  TMXTileSet(int paramInt, Attributes paramAttributes, TextureOptions paramTextureOptions)
  {
    this.mFirstGlobalTileID = SAXUtils.getIntAttribute(paramAttributes, "firstgid", 1);
    this.mName = paramAttributes.getValue("", "name");
    this.mTileWidth = SAXUtils.getIntAttributeOrThrow(paramAttributes, "tilewidth");
    this.mTileHeight = SAXUtils.getIntAttributeOrThrow(paramAttributes, "tileheight");
    this.mSpacing = SAXUtils.getIntAttribute(paramAttributes, "spacing", 0);
    this.mMargin = SAXUtils.getIntAttribute(paramAttributes, "margin", 0);
    this.mTextureOptions = paramTextureOptions;
  }
  
  TMXTileSet(Attributes paramAttributes, TextureOptions paramTextureOptions)
  {
    this(SAXUtils.getIntAttribute(paramAttributes, "firstgid", 1), paramAttributes, paramTextureOptions);
  }
  
  private static int determineCount(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = 0;
    int j = paramInt1 - paramInt3 * 2;
    for (;;)
    {
      if (j <= 0) {
        return i;
      }
      j = j - paramInt2 - paramInt4;
      i++;
    }
  }
  
  public void addTMXTileProperty(int paramInt, TMXTileProperty paramTMXTileProperty)
  {
    TMXProperties localTMXProperties1 = (TMXProperties)this.mTMXTileProperties.get(paramInt);
    if (localTMXProperties1 != null)
    {
      localTMXProperties1.add(paramTMXTileProperty);
      return;
    }
    TMXProperties localTMXProperties2 = new TMXProperties();
    localTMXProperties2.add(paramTMXTileProperty);
    this.mTMXTileProperties.put(paramInt, localTMXProperties2);
  }
  
  public final int getFirstGlobalTileID()
  {
    return this.mFirstGlobalTileID;
  }
  
  public String getImageSource()
  {
    return this.mImageSource;
  }
  
  public final String getName()
  {
    return this.mName;
  }
  
  public SparseArray<TMXProperties<TMXTileProperty>> getTMXTileProperties()
  {
    return this.mTMXTileProperties;
  }
  
  public TMXProperties<TMXTileProperty> getTMXTilePropertiesFromGlobalTileID(int paramInt)
  {
    int i = paramInt - this.mFirstGlobalTileID;
    return (TMXProperties)this.mTMXTileProperties.get(i);
  }
  
  public Texture getTexture()
  {
    return this.mTexture;
  }
  
  public TextureRegion getTextureRegionFromGlobalTileID(int paramInt)
  {
    int i = paramInt - this.mFirstGlobalTileID;
    int j = i % this.mTilesHorizontal;
    int k = i / this.mTilesHorizontal;
    int m = this.mMargin + j * (this.mSpacing + this.mTileWidth);
    int n = this.mMargin + k * (this.mSpacing + this.mTileHeight);
    return new TextureRegion(this.mTexture, m, n, this.mTileWidth, this.mTileHeight);
  }
  
  public final int getTileHeight()
  {
    return this.mTileHeight;
  }
  
  public final int getTileWidth()
  {
    return this.mTileWidth;
  }
  
  public void setImageSource(Context paramContext, TextureManager paramTextureManager, Attributes paramAttributes)
    throws TMXParseException
  {
    this.mImageSource = paramAttributes.getValue("", "source");
    AssetTextureSource localAssetTextureSource = new AssetTextureSource(paramContext, this.mImageSource);
    this.mTilesHorizontal = determineCount(localAssetTextureSource.getWidth(), this.mTileWidth, this.mMargin, this.mSpacing);
    this.mTilesVertical = determineCount(localAssetTextureSource.getHeight(), this.mTileHeight, this.mMargin, this.mSpacing);
    this.mTexture = TextureFactory.createForTextureSourceSize(localAssetTextureSource, this.mTextureOptions);
    String str1 = SAXUtils.getAttribute(paramAttributes, "trans", null);
    if (str1 == null)
    {
      TextureRegionFactory.createFromSource(this.mTexture, localAssetTextureSource, 0, 0);
      paramTextureManager.loadTexture(this.mTexture);
      return;
    }
    for (;;)
    {
      try
      {
        if (str1.startsWith("#"))
        {
          localObject = str1;
          int i = Color.parseColor((String)localObject);
          TextureRegionFactory.createFromSource(this.mTexture, new ColorKeyTextureSourceDecorator(localAssetTextureSource, i), 0, 0);
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw new TMXParseException("Illegal value: '" + str1 + "' for attribute 'trans' supplied!", localIllegalArgumentException);
      }
      String str2 = "#" + str1;
      Object localObject = str2;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXTileSet
 * JD-Core Version:    0.7.0.1
 */