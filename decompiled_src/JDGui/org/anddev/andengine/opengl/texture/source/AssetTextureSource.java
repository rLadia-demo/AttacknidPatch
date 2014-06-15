package org.anddev.andengine.opengl.texture.source;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import java.io.IOException;
import java.io.InputStream;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;

public class AssetTextureSource
  implements ITextureSource
{
  private final String mAssetPath;
  private final Context mContext;
  private final int mHeight;
  private final int mWidth;
  
  public AssetTextureSource(Context paramContext, String paramString)
  {
    this.mContext = paramContext;
    this.mAssetPath = paramString;
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inJustDecodeBounds = true;
    localInputStream = null;
    try
    {
      localInputStream = paramContext.getAssets().open(paramString);
      BitmapFactory.decodeStream(localInputStream, null, localOptions);
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + paramString, localIOException);
        StreamUtils.closeStream(localInputStream);
      }
    }
    finally
    {
      StreamUtils.closeStream(localInputStream);
    }
    this.mWidth = localOptions.outWidth;
    this.mHeight = localOptions.outHeight;
  }
  
  AssetTextureSource(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    this.mContext = paramContext;
    this.mAssetPath = paramString;
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }
  
  public AssetTextureSource clone()
  {
    return new AssetTextureSource(this.mContext, this.mAssetPath, this.mWidth, this.mHeight);
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  public Bitmap onLoadBitmap()
  {
    InputStream localInputStream = null;
    try
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inPreferredConfig = Bitmap.Config.ARGB_8888;
      localInputStream = this.mContext.getAssets().open(this.mAssetPath);
      Bitmap localBitmap = BitmapFactory.decodeStream(localInputStream, null, localOptions);
      return localBitmap;
    }
    catch (IOException localIOException)
    {
      Debug.e("Failed loading Bitmap in AssetTextureSource. AssetPath: " + this.mAssetPath, localIOException);
      return null;
    }
    finally
    {
      StreamUtils.closeStream(localInputStream);
    }
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + this.mAssetPath + ")";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.AssetTextureSource
 * JD-Core Version:    0.7.0.1
 */