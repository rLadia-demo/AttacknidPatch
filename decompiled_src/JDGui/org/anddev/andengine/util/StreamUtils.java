package org.anddev.andengine.util;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Scanner;

public class StreamUtils
{
  public static final int IO_BUFFER_SIZE = 8192;
  
  public static void closeStream(Closeable paramCloseable)
  {
    if (paramCloseable != null) {}
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public static void copy(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    copy(paramInputStream, paramOutputStream, -1L);
  }
  
  public static void copy(InputStream paramInputStream, OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    byte[] arrayOfByte = new byte[8192];
    long l = paramLong;
    int j;
    if (paramLong < 0L)
    {
      j = paramInputStream.read(arrayOfByte);
      if (j != -1) {}
    }
    for (;;)
    {
      paramOutputStream.flush();
      return;
      paramOutputStream.write(arrayOfByte, 0, j);
      break;
      for (;;)
      {
        int i;
        if (l > i)
        {
          paramOutputStream.write(arrayOfByte, 0, i);
          l -= i;
          i = paramInputStream.read(arrayOfByte);
          if (i == -1) {
            break;
          }
        }
      }
      paramOutputStream.write(arrayOfByte, 0, (int)l);
    }
  }
  
  /* Error */
  public static boolean copyAndClose(InputStream paramInputStream, OutputStream paramOutputStream)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: ldc2_w 26
    //   5: invokestatic 30	org/anddev/andengine/util/StreamUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;J)V
    //   8: aload_0
    //   9: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   12: aload_1
    //   13: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   16: iconst_1
    //   17: ireturn
    //   18: astore_3
    //   19: aload_0
    //   20: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   23: aload_1
    //   24: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   27: iconst_0
    //   28: ireturn
    //   29: astore_2
    //   30: aload_0
    //   31: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   34: aload_1
    //   35: invokestatic 49	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   38: aload_2
    //   39: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	40	0	paramInputStream	InputStream
    //   0	40	1	paramOutputStream	OutputStream
    //   29	10	2	localObject	Object
    //   18	1	3	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   0	8	18	java/io/IOException
    //   0	8	29	finally
  }
  
  public static void flushCloseStream(OutputStream paramOutputStream)
  {
    if (paramOutputStream != null) {}
    try
    {
      paramOutputStream.flush();
      closeStream(paramOutputStream);
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public static void flushCloseWriter(Writer paramWriter)
  {
    if (paramWriter != null) {}
    try
    {
      paramWriter.flush();
      closeStream(paramWriter);
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public static final String readFully(InputStream paramInputStream)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Scanner localScanner = new Scanner(paramInputStream);
    for (;;)
    {
      if (!localScanner.hasNextLine()) {
        return localStringBuilder.toString();
      }
      localStringBuilder.append(localScanner.nextLine());
    }
  }
  
  public static byte[] streamToBytes(InputStream paramInputStream)
    throws IOException
  {
    return streamToBytes(paramInputStream, -1);
  }
  
  public static byte[] streamToBytes(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream(Math.min(paramInt, 8192));
    copy(paramInputStream, localByteArrayOutputStream, paramInt);
    return localByteArrayOutputStream.toByteArray();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.StreamUtils
 * JD-Core Version:    0.7.0.1
 */