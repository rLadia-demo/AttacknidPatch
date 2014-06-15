package org.anddev.andengine.extension.input.touch.controller;

import android.content.Context;
import android.content.pm.PackageManager;
import java.lang.reflect.Method;
import org.anddev.andengine.util.SystemUtils;

public class MultiTouch
{
  private static Boolean SUPPORTED = null;
  private static Boolean SUPPORTED_DISTINCT = null;
  
  private static boolean hasFeature(Context paramContext, String paramString)
  {
    try
    {
      Method localMethod = PackageManager.class.getMethod("hasSystemFeature", new Class[] { String.class });
      if (localMethod == null) {
        return false;
      }
      boolean bool = ((Boolean)localMethod.invoke(paramContext.getPackageManager(), new Object[] { paramString })).booleanValue();
      return bool;
    }
    catch (Throwable localThrowable) {}
    return false;
  }
  
  public static boolean isSupported(Context paramContext)
  {
    if (SUPPORTED == null) {
      if ((!SystemUtils.isAndroidVersionOrHigher(7)) || (!hasFeature(paramContext, "android.hardware.touchscreen.multitouch"))) {
        break label39;
      }
    }
    label39:
    for (boolean bool = true;; bool = false)
    {
      SUPPORTED = Boolean.valueOf(bool);
      return SUPPORTED.booleanValue();
    }
  }
  
  public static boolean isSupportedByAndroidVersion()
  {
    return SystemUtils.isAndroidVersionOrHigher(5);
  }
  
  public static boolean isSupportedDistinct(Context paramContext)
  {
    if (SUPPORTED_DISTINCT == null) {
      if ((!SystemUtils.isAndroidVersionOrHigher(7)) || (!hasFeature(paramContext, "android.hardware.touchscreen.multitouch.distinct"))) {
        break label39;
      }
    }
    label39:
    for (boolean bool = true;; bool = false)
    {
      SUPPORTED_DISTINCT = Boolean.valueOf(bool);
      return SUPPORTED_DISTINCT.booleanValue();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.input.touch.controller.MultiTouch
 * JD-Core Version:    0.7.0.1
 */