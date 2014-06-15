package org.anddev.andengine.opengl.font;

import android.content.Context;
import android.graphics.Typeface;
import org.anddev.andengine.opengl.texture.Texture;

public class FontFactory
{
  private static String sAssetBasePath = "";
  
  public static Font create(Texture paramTexture, Typeface paramTypeface, float paramFloat, boolean paramBoolean, int paramInt)
  {
    return new Font(paramTexture, paramTypeface, paramFloat, paramBoolean, paramInt);
  }
  
  public static Font createFromAsset(Texture paramTexture, Context paramContext, String paramString, float paramFloat, boolean paramBoolean, int paramInt)
  {
    return new Font(paramTexture, Typeface.createFromAsset(paramContext.getAssets(), sAssetBasePath + paramString), paramFloat, paramBoolean, paramInt);
  }
  
  public static StrokeFont createStroke(Texture paramTexture, Typeface paramTypeface, float paramFloat, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    return new StrokeFont(paramTexture, paramTypeface, paramFloat, paramBoolean, paramInt1, paramInt2, paramInt3);
  }
  
  public static StrokeFont createStroke(Texture paramTexture, Typeface paramTypeface, float paramFloat, boolean paramBoolean1, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean2)
  {
    return new StrokeFont(paramTexture, paramTypeface, paramFloat, paramBoolean1, paramInt1, paramInt2, paramInt3, paramBoolean2);
  }
  
  public static StrokeFont createStrokeFromAsset(Texture paramTexture, Context paramContext, String paramString, float paramFloat, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    return new StrokeFont(paramTexture, Typeface.createFromAsset(paramContext.getAssets(), sAssetBasePath + paramString), paramFloat, paramBoolean, paramInt1, paramInt2, paramInt3);
  }
  
  public static StrokeFont createStrokeFromAsset(Texture paramTexture, Context paramContext, String paramString, float paramFloat, boolean paramBoolean1, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean2)
  {
    return new StrokeFont(paramTexture, Typeface.createFromAsset(paramContext.getAssets(), sAssetBasePath + paramString), paramFloat, paramBoolean1, paramInt1, paramInt2, paramInt3, paramBoolean2);
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
 * Qualified Name:     org.anddev.andengine.opengl.font.FontFactory
 * JD-Core Version:    0.7.0.1
 */