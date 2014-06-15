package org.anddev.andengine.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.os.Environment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;

public class FileUtils
{
  public static void copyFile(File paramFile1, File paramFile2)
    throws IOException
  {
    FileInputStream localFileInputStream = new FileInputStream(paramFile1);
    FileOutputStream localFileOutputStream = new FileOutputStream(paramFile2);
    try
    {
      StreamUtils.copy(localFileInputStream, localFileOutputStream);
      return;
    }
    finally
    {
      StreamUtils.closeStream(localFileInputStream);
      StreamUtils.closeStream(localFileOutputStream);
    }
  }
  
  public static void copyToExternalStorage(Context paramContext, int paramInt, String paramString)
    throws FileNotFoundException
  {
    copyToExternalStorage(paramContext, paramContext.getResources().openRawResource(paramInt), paramString);
  }
  
  public static void copyToExternalStorage(Context paramContext, InputStream paramInputStream, String paramString)
    throws FileNotFoundException
  {
    if (isExternalStorageWriteable())
    {
      StreamUtils.copyAndClose(paramInputStream, new FileOutputStream(getAbsolutePathOnExternalStorage(paramContext, paramString)));
      return;
    }
    throw new IllegalStateException("External Storage is not writeable.");
  }
  
  public static void copyToExternalStorage(Context paramContext, String paramString1, String paramString2)
    throws IOException
  {
    copyToExternalStorage(paramContext, paramContext.getAssets().open(paramString1), paramString2);
  }
  
  public static boolean deleteDirectory(File paramFile)
  {
    String[] arrayOfString;
    int i;
    if (paramFile.isDirectory())
    {
      arrayOfString = paramFile.list();
      i = arrayOfString.length;
    }
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return paramFile.delete();
      }
      if (!deleteDirectory(new File(paramFile, arrayOfString[j]))) {
        return false;
      }
    }
  }
  
  public static boolean ensureDirectoriesExistOnExternalStorage(Context paramContext, String paramString)
  {
    if (isDirectoryExistingOnExternalStorage(paramContext, paramString)) {
      return true;
    }
    if (isExternalStorageWriteable()) {
      return new File(getAbsolutePathOnExternalStorage(paramContext, paramString)).mkdirs();
    }
    throw new IllegalStateException("External Storage is not writeable.");
  }
  
  public static String getAbsolutePathOnExternalStorage(Context paramContext, String paramString)
  {
    return Environment.getExternalStorageDirectory() + "/Android/data/" + paramContext.getApplicationInfo().packageName + "/files/" + paramString;
  }
  
  public static String[] getDirectoryListOnExternalStorage(Context paramContext, String paramString)
    throws FileNotFoundException
  {
    return new File(getAbsolutePathOnExternalStorage(paramContext, paramString)).list();
  }
  
  public static String[] getDirectoryListOnExternalStorage(Context paramContext, String paramString, FilenameFilter paramFilenameFilter)
    throws FileNotFoundException
  {
    return new File(getAbsolutePathOnExternalStorage(paramContext, paramString)).list(paramFilenameFilter);
  }
  
  public static boolean isDirectoryExistingOnExternalStorage(Context paramContext, String paramString)
  {
    if (isExternalStorageReadable()) {
      return new File(getAbsolutePathOnExternalStorage(paramContext, paramString)).exists();
    }
    throw new IllegalStateException("External Storage is not readable.");
  }
  
  public static boolean isExternalStorageReadable()
  {
    String str = Environment.getExternalStorageState();
    return (str.equals("mounted")) || (str.equals("mounted_ro"));
  }
  
  public static boolean isExternalStorageWriteable()
  {
    return Environment.getExternalStorageState().equals("mounted");
  }
  
  public static boolean isFileExistingOnExternalStorage(Context paramContext, String paramString)
  {
    if (isExternalStorageReadable()) {
      return new File(getAbsolutePathOnExternalStorage(paramContext, paramString)).exists();
    }
    throw new IllegalStateException("External Storage is not readable.");
  }
  
  public static InputStream openOnExternalStorage(Context paramContext, String paramString)
    throws FileNotFoundException
  {
    return new FileInputStream(getAbsolutePathOnExternalStorage(paramContext, paramString));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.FileUtils
 * JD-Core Version:    0.7.0.1
 */