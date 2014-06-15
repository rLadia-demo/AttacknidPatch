package org.anddev.andengine.util;

import android.util.Log;
import org.anddev.andengine.util.constants.Constants;

public class Debug
  implements Constants
{
  private static DebugLevel DEBUGLEVEL = DebugLevel.VERBOSE;
  
  public static void d(String paramString)
  {
    d(paramString, null);
  }
  
  public static void d(String paramString, Throwable paramThrowable)
  {
    if (DEBUGLEVEL.isSameOrLessThan(DebugLevel.DEBUG)) {
      Log.d("AndEngine", paramString, paramThrowable);
    }
  }
  
  public static void e(String paramString)
  {
    e(paramString, null);
  }
  
  public static void e(String paramString, Throwable paramThrowable)
  {
    if (DEBUGLEVEL.isSameOrLessThan(DebugLevel.ERROR))
    {
      if (paramThrowable == null) {
        Log.e("AndEngine", paramString, new Exception());
      }
    }
    else {
      return;
    }
    Log.e("AndEngine", paramString, paramThrowable);
  }
  
  public static void e(Throwable paramThrowable)
  {
    e("AndEngine", paramThrowable);
  }
  
  public static DebugLevel getDebugLevel()
  {
    return DEBUGLEVEL;
  }
  
  public static void i(String paramString)
  {
    i(paramString, null);
  }
  
  public static void i(String paramString, Throwable paramThrowable)
  {
    if (DEBUGLEVEL.isSameOrLessThan(DebugLevel.INFO)) {
      Log.i("AndEngine", paramString, paramThrowable);
    }
  }
  
  public static void setDebugLevel(DebugLevel paramDebugLevel)
  {
    if (paramDebugLevel == null) {
      throw new IllegalArgumentException("pDebugLevel must not be null!");
    }
    DEBUGLEVEL = paramDebugLevel;
  }
  
  public static void v(String paramString)
  {
    v(paramString, null);
  }
  
  public static void v(String paramString, Throwable paramThrowable)
  {
    if (DEBUGLEVEL.isSameOrLessThan(DebugLevel.VERBOSE)) {
      Log.v("AndEngine", paramString, paramThrowable);
    }
  }
  
  public static void w(String paramString)
  {
    w(paramString, null);
  }
  
  public static void w(String paramString, Throwable paramThrowable)
  {
    if (DEBUGLEVEL.isSameOrLessThan(DebugLevel.WARNING))
    {
      if (paramThrowable == null) {
        Log.w("AndEngine", paramString, new Exception());
      }
    }
    else {
      return;
    }
    Log.w("AndEngine", paramString, paramThrowable);
  }
  
  public static void w(Throwable paramThrowable)
  {
    w("AndEngine", paramThrowable);
  }
  
  public static enum DebugLevel
    implements Comparable<DebugLevel>
  {
    public static DebugLevel ALL = VERBOSE;
    
    static
    {
      ERROR = new DebugLevel("ERROR", 1);
      WARNING = new DebugLevel("WARNING", 2);
      INFO = new DebugLevel("INFO", 3);
      DEBUG = new DebugLevel("DEBUG", 4);
      VERBOSE = new DebugLevel("VERBOSE", 5);
      DebugLevel[] arrayOfDebugLevel = new DebugLevel[6];
      arrayOfDebugLevel[0] = NONE;
      arrayOfDebugLevel[1] = ERROR;
      arrayOfDebugLevel[2] = WARNING;
      arrayOfDebugLevel[3] = INFO;
      arrayOfDebugLevel[4] = DEBUG;
      arrayOfDebugLevel[5] = VERBOSE;
      ENUM$VALUES = arrayOfDebugLevel;
    }
    
    private boolean isSameOrLessThan(DebugLevel paramDebugLevel)
    {
      return compareTo(paramDebugLevel) >= 0;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.Debug
 * JD-Core Version:    0.7.0.1
 */