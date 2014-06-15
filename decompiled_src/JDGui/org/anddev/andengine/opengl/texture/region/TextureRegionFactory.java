package org.anddev.andengine.opengl.texture.region;

import android.content.Context;
import org.anddev.andengine.opengl.texture.BuildableTexture;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.Texture.TextureSourceWithLocation;
import org.anddev.andengine.opengl.texture.source.AssetTextureSource;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.opengl.texture.source.ResourceTextureSource;
import org.anddev.andengine.util.Callback;

public class TextureRegionFactory
{
  private static String sAssetBasePath = "";
  
  public static TextureRegion createFromAsset(BuildableTexture paramBuildableTexture, Context paramContext, String paramString)
  {
    return createFromSource(paramBuildableTexture, new AssetTextureSource(paramContext, sAssetBasePath + paramString));
  }
  
  public static TextureRegion createFromAsset(Texture paramTexture, Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    return createFromSource(paramTexture, new AssetTextureSource(paramContext, sAssetBasePath + paramString), paramInt1, paramInt2);
  }
  
  public static TextureRegion createFromResource(BuildableTexture paramBuildableTexture, Context paramContext, int paramInt)
  {
    return createFromSource(paramBuildableTexture, new ResourceTextureSource(paramContext, paramInt));
  }
  
  public static TextureRegion createFromResource(Texture paramTexture, Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    return createFromSource(paramTexture, new ResourceTextureSource(paramContext, paramInt1), paramInt2, paramInt3);
  }
  
  public static TextureRegion createFromSource(BuildableTexture paramBuildableTexture, ITextureSource paramITextureSource)
  {
    TextureRegion localTextureRegion = new TextureRegion(paramBuildableTexture, 0, 0, paramITextureSource.getWidth(), paramITextureSource.getHeight());
    paramBuildableTexture.addTextureSource(paramITextureSource, new Callback()
    {
      public void onCallback(Texture.TextureSourceWithLocation paramAnonymousTextureSourceWithLocation)
      {
        TextureRegionFactory.this.setTexturePosition(paramAnonymousTextureSourceWithLocation.getTexturePositionX(), paramAnonymousTextureSourceWithLocation.getTexturePositionY());
      }
    });
    return localTextureRegion;
  }
  
  public static TextureRegion createFromSource(Texture paramTexture, ITextureSource paramITextureSource, int paramInt1, int paramInt2)
  {
    TextureRegion localTextureRegion = new TextureRegion(paramTexture, paramInt1, paramInt2, paramITextureSource.getWidth(), paramITextureSource.getHeight());
    paramTexture.addTextureSource(paramITextureSource, localTextureRegion.getTexturePositionX(), localTextureRegion.getTexturePositionY());
    return localTextureRegion;
  }
  
  public static TiledTextureRegion createTiledFromAsset(BuildableTexture paramBuildableTexture, Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    return createTiledFromSource(paramBuildableTexture, new AssetTextureSource(paramContext, sAssetBasePath + paramString), paramInt1, paramInt2);
  }
  
  public static TiledTextureRegion createTiledFromAsset(Texture paramTexture, Context paramContext, String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return createTiledFromSource(paramTexture, new AssetTextureSource(paramContext, sAssetBasePath + paramString), paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static TiledTextureRegion createTiledFromResource(BuildableTexture paramBuildableTexture, Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    return createTiledFromSource(paramBuildableTexture, new ResourceTextureSource(paramContext, paramInt1), paramInt2, paramInt3);
  }
  
  public static TiledTextureRegion createTiledFromResource(Texture paramTexture, Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    return createTiledFromSource(paramTexture, new ResourceTextureSource(paramContext, paramInt1), paramInt2, paramInt3, paramInt4, paramInt5);
  }
  
  public static TiledTextureRegion createTiledFromSource(BuildableTexture paramBuildableTexture, ITextureSource paramITextureSource, int paramInt1, int paramInt2)
  {
    TiledTextureRegion localTiledTextureRegion = new TiledTextureRegion(paramBuildableTexture, 0, 0, paramITextureSource.getWidth(), paramITextureSource.getHeight(), paramInt1, paramInt2);
    paramBuildableTexture.addTextureSource(paramITextureSource, new Callback()
    {
      public void onCallback(Texture.TextureSourceWithLocation paramAnonymousTextureSourceWithLocation)
      {
        TextureRegionFactory.this.setTexturePosition(paramAnonymousTextureSourceWithLocation.getTexturePositionX(), paramAnonymousTextureSourceWithLocation.getTexturePositionY());
      }
    });
    return localTiledTextureRegion;
  }
  
  public static TiledTextureRegion createTiledFromSource(Texture paramTexture, ITextureSource paramITextureSource, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    TiledTextureRegion localTiledTextureRegion = new TiledTextureRegion(paramTexture, paramInt1, paramInt2, paramITextureSource.getWidth(), paramITextureSource.getHeight(), paramInt3, paramInt4);
    paramTexture.addTextureSource(paramITextureSource, localTiledTextureRegion.getTexturePositionX(), localTiledTextureRegion.getTexturePositionY());
    return localTiledTextureRegion;
  }
  
  public static TextureRegion extractFromTexture(Texture paramTexture, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return new TextureRegion(paramTexture, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static void setAssetBasePath(String paramString)
  {
    if ((paramString.endsWith("/")) || (paramString.length() == 0))
    {
      sAssetBasePath = paramString;
      return;
    }
    throw new IllegalStateException("pAssetBasePath must end with '/' or be lenght zero.");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.region.TextureRegionFactory
 * JD-Core Version:    0.7.0.1
 */