package org.anddev.andengine.util;

import android.os.Build.VERSION;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;
import java.util.regex.MatchResult;

public class SystemUtils
{
  private static final String BOGOMIPS_PATTERN = "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n";
  private static final String MEMFREE_PATTERN = "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";
  private static final String MEMTOTAL_PATTERN = "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";
  
  public static float getCPUBogoMips()
    throws SystemUtils.SystemUtilsException
  {
    MatchResult localMatchResult = matchSystemFile("/proc/cpuinfo", "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n", 1000);
    try
    {
      if (localMatchResult.groupCount() > 0) {
        return Float.parseFloat(localMatchResult.group(1));
      }
      throw new SystemUtilsException();
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new SystemUtilsException(localNumberFormatException);
    }
  }
  
  public static int getCPUFrequencyCurrent()
    throws SystemUtils.SystemUtilsException
  {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
  }
  
  public static int getCPUFrequencyMax()
    throws SystemUtils.SystemUtilsException
  {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
  }
  
  public static int getCPUFrequencyMaxScaling()
    throws SystemUtils.SystemUtilsException
  {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq");
  }
  
  public static int getCPUFrequencyMin()
    throws SystemUtils.SystemUtilsException
  {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq");
  }
  
  public static int getCPUFrequencyMinScaling()
    throws SystemUtils.SystemUtilsException
  {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq");
  }
  
  public static int getMemoryFree()
    throws SystemUtils.SystemUtilsException
  {
    MatchResult localMatchResult = matchSystemFile("/proc/meminfo", "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
    try
    {
      if (localMatchResult.groupCount() > 0) {
        return Integer.parseInt(localMatchResult.group(1));
      }
      throw new SystemUtilsException();
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new SystemUtilsException(localNumberFormatException);
    }
  }
  
  public static int getMemoryTotal()
    throws SystemUtils.SystemUtilsException
  {
    MatchResult localMatchResult = matchSystemFile("/proc/meminfo", "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
    try
    {
      if (localMatchResult.groupCount() > 0) {
        return Integer.parseInt(localMatchResult.group(1));
      }
      throw new SystemUtilsException();
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new SystemUtilsException(localNumberFormatException);
    }
  }
  
  public static boolean isAndroidVersionOrHigher(int paramInt)
  {
    return Integer.parseInt(Build.VERSION.SDK) >= paramInt;
  }
  
  private static MatchResult matchSystemFile(String paramString1, String paramString2, int paramInt)
    throws SystemUtils.SystemUtilsException
  {
    int i = 1;
    InputStream localInputStream = null;
    try
    {
      localInputStream = new ProcessBuilder(new String[] { "/system/bin/cat", paramString1 }).start().getInputStream();
      Scanner localScanner = new Scanner(localInputStream);
      if (localScanner.findWithinHorizon(paramString2, paramInt) != null) {}
      while (i != 0)
      {
        MatchResult localMatchResult = localScanner.match();
        return localMatchResult;
        i = 0;
      }
      throw new SystemUtilsException();
    }
    catch (IOException localIOException)
    {
      throw new SystemUtilsException(localIOException);
    }
    finally
    {
      StreamUtils.closeStream(localInputStream);
    }
  }
  
  /* Error */
  private static int readSystemFileAsInt(String paramString)
    throws SystemUtils.SystemUtilsException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: new 89	java/lang/ProcessBuilder
    //   5: dup
    //   6: iconst_2
    //   7: anewarray 91	java/lang/String
    //   10: dup
    //   11: iconst_0
    //   12: ldc 93
    //   14: aastore
    //   15: dup
    //   16: iconst_1
    //   17: aload_0
    //   18: aastore
    //   19: invokespecial 96	java/lang/ProcessBuilder:<init>	([Ljava/lang/String;)V
    //   22: invokevirtual 100	java/lang/ProcessBuilder:start	()Ljava/lang/Process;
    //   25: invokevirtual 106	java/lang/Process:getInputStream	()Ljava/io/InputStream;
    //   28: astore_1
    //   29: aload_1
    //   30: invokestatic 129	org/anddev/andengine/util/StreamUtils:readFully	(Ljava/io/InputStream;)Ljava/lang/String;
    //   33: invokestatic 77	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   36: istore 5
    //   38: aload_1
    //   39: invokestatic 125	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   42: iload 5
    //   44: ireturn
    //   45: astore 4
    //   47: new 22	org/anddev/andengine/util/SystemUtils$SystemUtilsException
    //   50: dup
    //   51: aload 4
    //   53: invokespecial 50	org/anddev/andengine/util/SystemUtils$SystemUtilsException:<init>	(Ljava/lang/Throwable;)V
    //   56: athrow
    //   57: astore_3
    //   58: aload_1
    //   59: invokestatic 125	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   62: aload_3
    //   63: athrow
    //   64: astore_2
    //   65: new 22	org/anddev/andengine/util/SystemUtils$SystemUtilsException
    //   68: dup
    //   69: aload_2
    //   70: invokespecial 50	org/anddev/andengine/util/SystemUtils$SystemUtilsException:<init>	(Ljava/lang/Throwable;)V
    //   73: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	74	0	paramString	String
    //   1	58	1	localInputStream	InputStream
    //   64	6	2	localNumberFormatException	NumberFormatException
    //   57	6	3	localObject	Object
    //   45	7	4	localIOException	IOException
    //   36	7	5	i	int
    // Exception table:
    //   from	to	target	type
    //   2	38	45	java/io/IOException
    //   2	38	57	finally
    //   47	57	57	finally
    //   65	74	57	finally
    //   2	38	64	java/lang/NumberFormatException
  }
  
  public static class SystemUtilsException
    extends Exception
  {
    private static final long serialVersionUID = -7256483361095147596L;
    
    public SystemUtilsException() {}
    
    public SystemUtilsException(Throwable paramThrowable)
    {
      super();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.SystemUtils
 * JD-Core Version:    0.7.0.1
 */