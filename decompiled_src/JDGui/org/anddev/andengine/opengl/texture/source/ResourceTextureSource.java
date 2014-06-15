package org.anddev.andengine.opengl.texture.source;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;

public class ResourceTextureSource
  implements ITextureSource
{
  private final Context mContext;
  private final int mDrawableResourceID;
  private final int mHeight;
  private final int mWidth;
  
  public ResourceTextureSource(Context paramContext, int paramInt)
  {
    this.mContext = paramContext;
    this.mDrawableResourceID = paramInt;
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inJustDecodeBounds = true;
    BitmapFactory.decodeResource(paramContext.getResources(), paramInt, localOptions);
    this.mWidth = localOptions.outWidth;
    this.mHeight = localOptions.outHeight;
  }
  
  protected ResourceTextureSource(Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    this.mContext = paramContext;
    this.mDrawableResourceID = paramInt1;
    this.mWidth = paramInt2;
    this.mHeight = paramInt3;
  }
  
  public ResourceTextureSource clone()
  {
    return new ResourceTextureSource(this.mContext, this.mDrawableResourceID, this.mWidth, this.mHeight);
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
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inPreferredConfig = Bitmap.Config.ARGB_8888;
    return BitmapFactory.decodeResource(this.mContext.getResources(), this.mDrawableResourceID, localOptions);
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + this.mDrawableResourceID + ")";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.ResourceTextureSource
 * JD-Core Version:    0.7.0.1
 */