package com.SixClawWorm.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.os.Environment;
import android.os.StatFs;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;

public class BitmapUtil
{
  public static final String DIR = "/sdcard/hypers";
  private static int FREE_SD_SPACE_NEEDED_TO_CACHE = 1;
  private static int MB = 1048576;
  
  public static boolean Exist(String paramString)
  {
    return new File("/sdcard/hypers" + paramString).exists();
  }
  
  public static Bitmap GetBitmap(String paramString, int paramInt)
  {
    if (paramString == null) {
      return null;
    }
    String str = URLEncoder.encode(paramString);
    Bitmap localBitmap;
    if (Exist("/sdcard/hypers/" + str)) {
      localBitmap = BitmapFactory.decodeFile("/sdcard/hypers/" + str);
    }
    for (;;)
    {
      return localBitmap;
      try
      {
        localURL = new URL(paramString);
      }
      catch (Exception localException1)
      {
        try
        {
          URL localURL;
          InputStream localInputStream = localURL.openStream();
          localBitmap = BitmapFactory.decodeStream(localInputStream);
          if (localBitmap != null) {
            saveBmpToSd(localBitmap, str, paramInt);
          }
          localInputStream.close();
        }
        catch (Exception localException2)
        {
          break label101;
        }
        localException1 = localException1;
      }
    }
    label101:
    localException1.printStackTrace();
    return null;
  }
  
  public static Bitmap ReadBitmapById(Context paramContext, int paramInt)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inPreferredConfig = Bitmap.Config.RGB_565;
    localOptions.inPurgeable = true;
    localOptions.inInputShareable = true;
    return BitmapFactory.decodeStream(paramContext.getResources().openRawResource(paramInt), null, localOptions);
  }
  
  public static Bitmap ReadBitmapById(Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inPreferredConfig = Bitmap.Config.ARGB_8888;
    localOptions.inInputShareable = true;
    localOptions.inPurgeable = true;
    return getBitmap(BitmapFactory.decodeStream(paramContext.getResources().openRawResource(paramInt1), null, localOptions), paramInt2, paramInt3);
  }
  
  private static int freeSpaceOnSd()
  {
    StatFs localStatFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
    return (int)(localStatFs.getAvailableBlocks() * localStatFs.getBlockSize() / MB);
  }
  
  public static Bitmap getBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    Matrix localMatrix = new Matrix();
    float f = paramInt1 / i;
    (paramInt2 / j);
    localMatrix.postScale(f, f);
    return Bitmap.createBitmap(paramBitmap, 0, 0, i, j, localMatrix, true);
  }
  
  public static void saveBmpToSd(Bitmap paramBitmap, String paramString, int paramInt)
  {
    if (FREE_SD_SPACE_NEEDED_TO_CACHE > freeSpaceOnSd()) {}
    while (!"mounted".equals(Environment.getExternalStorageState())) {
      return;
    }
    File localFile1 = new File("/sdcard/hypers");
    if (!localFile1.exists()) {
      localFile1.mkdirs();
    }
    File localFile2 = new File("/sdcard/hypers/" + paramString);
    try
    {
      localFile2.createNewFile();
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile2);
      paramBitmap.compress(Bitmap.CompressFormat.PNG, paramInt, localFileOutputStream);
      localFileOutputStream.flush();
      localFileOutputStream.close();
      return;
    }
    catch (FileNotFoundException localFileNotFoundException) {}catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.utils.BitmapUtil
 * JD-Core Version:    0.7.0.1
 */