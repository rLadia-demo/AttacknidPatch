package org.anddev.andengine.opengl.texture.source;

import java.io.File;

public class FileTextureSource
  implements ITextureSource
{
  private final File mFile;
  private final int mHeight;
  private final int mWidth;
  
  /* Error */
  public FileTextureSource(File paramFile)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 18	java/lang/Object:<init>	()V
    //   4: aload_0
    //   5: aload_1
    //   6: putfield 20	org/anddev/andengine/opengl/texture/source/FileTextureSource:mFile	Ljava/io/File;
    //   9: new 22	android/graphics/BitmapFactory$Options
    //   12: dup
    //   13: invokespecial 23	android/graphics/BitmapFactory$Options:<init>	()V
    //   16: astore_2
    //   17: aload_2
    //   18: iconst_1
    //   19: putfield 27	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   22: aconst_null
    //   23: astore_3
    //   24: new 29	java/io/FileInputStream
    //   27: dup
    //   28: aload_1
    //   29: invokespecial 31	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   32: astore 4
    //   34: aload 4
    //   36: aconst_null
    //   37: aload_2
    //   38: invokestatic 37	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   41: pop
    //   42: aload 4
    //   44: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   47: aload_0
    //   48: aload_2
    //   49: getfield 46	android/graphics/BitmapFactory$Options:outWidth	I
    //   52: putfield 48	org/anddev/andengine/opengl/texture/source/FileTextureSource:mWidth	I
    //   55: aload_0
    //   56: aload_2
    //   57: getfield 51	android/graphics/BitmapFactory$Options:outHeight	I
    //   60: putfield 53	org/anddev/andengine/opengl/texture/source/FileTextureSource:mHeight	I
    //   63: return
    //   64: astore 5
    //   66: new 55	java/lang/StringBuilder
    //   69: dup
    //   70: ldc 57
    //   72: invokespecial 60	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   75: aload_1
    //   76: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   79: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   82: aload 5
    //   84: invokestatic 74	org/anddev/andengine/util/Debug:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   87: aload_3
    //   88: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   91: goto -44 -> 47
    //   94: astore 6
    //   96: aload_3
    //   97: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   100: aload 6
    //   102: athrow
    //   103: astore 6
    //   105: aload 4
    //   107: astore_3
    //   108: goto -12 -> 96
    //   111: astore 5
    //   113: aload 4
    //   115: astore_3
    //   116: goto -50 -> 66
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	119	0	this	FileTextureSource
    //   0	119	1	paramFile	File
    //   16	41	2	localOptions	android.graphics.BitmapFactory.Options
    //   23	93	3	localObject1	Object
    //   32	82	4	localFileInputStream	java.io.FileInputStream
    //   64	19	5	localIOException1	java.io.IOException
    //   111	1	5	localIOException2	java.io.IOException
    //   94	7	6	localObject2	Object
    //   103	1	6	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   24	34	64	java/io/IOException
    //   24	34	94	finally
    //   66	87	94	finally
    //   34	42	103	finally
    //   34	42	111	java/io/IOException
  }
  
  FileTextureSource(File paramFile, int paramInt1, int paramInt2)
  {
    this.mFile = paramFile;
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }
  
  public FileTextureSource clone()
  {
    return new FileTextureSource(this.mFile, this.mWidth, this.mHeight);
  }
  
  public int getHeight()
  {
    return this.mHeight;
  }
  
  public int getWidth()
  {
    return this.mWidth;
  }
  
  /* Error */
  public android.graphics.Bitmap onLoadBitmap()
  {
    // Byte code:
    //   0: new 22	android/graphics/BitmapFactory$Options
    //   3: dup
    //   4: invokespecial 23	android/graphics/BitmapFactory$Options:<init>	()V
    //   7: astore_1
    //   8: aload_1
    //   9: getstatic 96	android/graphics/Bitmap$Config:ARGB_8888	Landroid/graphics/Bitmap$Config;
    //   12: putfield 99	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   15: aconst_null
    //   16: astore_2
    //   17: new 29	java/io/FileInputStream
    //   20: dup
    //   21: aload_0
    //   22: getfield 20	org/anddev/andengine/opengl/texture/source/FileTextureSource:mFile	Ljava/io/File;
    //   25: invokespecial 31	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   28: astore_3
    //   29: aload_3
    //   30: aconst_null
    //   31: aload_1
    //   32: invokestatic 37	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   35: astore 6
    //   37: aload_3
    //   38: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   41: aload 6
    //   43: areturn
    //   44: astore 4
    //   46: new 55	java/lang/StringBuilder
    //   49: dup
    //   50: ldc 57
    //   52: invokespecial 60	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   55: aload_0
    //   56: getfield 20	org/anddev/andengine/opengl/texture/source/FileTextureSource:mFile	Ljava/io/File;
    //   59: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   62: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   65: aload 4
    //   67: invokestatic 74	org/anddev/andengine/util/Debug:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   70: aload_2
    //   71: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   74: aconst_null
    //   75: areturn
    //   76: astore 5
    //   78: aload_2
    //   79: invokestatic 43	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   82: aload 5
    //   84: athrow
    //   85: astore 5
    //   87: aload_3
    //   88: astore_2
    //   89: goto -11 -> 78
    //   92: astore 4
    //   94: aload_3
    //   95: astore_2
    //   96: goto -50 -> 46
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	99	0	this	FileTextureSource
    //   7	25	1	localOptions	android.graphics.BitmapFactory.Options
    //   16	80	2	localObject1	Object
    //   28	67	3	localFileInputStream	java.io.FileInputStream
    //   44	22	4	localIOException1	java.io.IOException
    //   92	1	4	localIOException2	java.io.IOException
    //   76	7	5	localObject2	Object
    //   85	1	5	localObject3	Object
    //   35	7	6	localBitmap	android.graphics.Bitmap
    // Exception table:
    //   from	to	target	type
    //   17	29	44	java/io/IOException
    //   17	29	76	finally
    //   46	70	76	finally
    //   29	37	85	finally
    //   29	37	92	java/io/IOException
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + this.mFile + ")";
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.source.FileTextureSource
 * JD-Core Version:    0.7.0.1
 */